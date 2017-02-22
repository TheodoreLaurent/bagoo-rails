class BagsController < ApplicationController
  skip_before_action :authenticate_user!, only: [:show, :index]
  before_action :set_bag, only: [:show, :edit, :update, :destroy]

  def index
    @bags = Bag.search(params[:query]).where.not(latitude: nil, longitude: nil)

    @hash = Gmaps4rails.build_markers(@bags) do |bag, marker|
      marker.lat bag.latitude
      marker.lng baglongitude
    end
   end

  def show
    @bag_coordinates = { lat: @bag.latitude, lng: @bag.longitude }
    @booking = Booking.new
    @checkin = params[:checkin_query]
    @checkout = params[:checkout_query]
    if params[:checkin_query].empty? || params[:checkout_query].empty?
      @bags = Bag.search(params[:query])
    else
      @bags = Bag.search(params[:query]).where("datein <= :start_date AND dateout >= :end_date", {start_date: params[:checkin_query], end_date: params[:checkout_query]})
    end
  end

  def new
    @bag = Bag.new
  end

  def create
    @bag = Bag.new(bag_params)
    @bag.user = current_user
    if@bag.save
      redirect_to bag_path(@bag)
    else
      render :new
    end
  end

  def edit
  end

  def update
    @bag.update(bag_params)
    redirect_to bag_path(@bag)
  end

  def destroy
    @bag.destroy
    redirect_to listings_path
  end

  private

  def set_bag
    @bag = Bag.find(params[:id])
  end

  def bag_params
    params.require(:bag).permit(:title, :category, :brand, :capacity, :price_per_day, :description, :address, :latitude, :longitude, photos: [])
  end
end

