class BagsController < ApplicationController
  skip_before_action :authenticate_user!, only: [:show, :index]
  before_action :set_bag, only: [:show, :edit, :update, :destroy]


  def index
    # @bags = Bag.search(params[:query])

    @hash = Gmaps4rails.build_markers(@bags) do |bag, marker|
      marker.lat bag.latitude
      marker.lng bag.longitude
    end
    @checkin = params[:checkin_query]
    @checkout = params[:checkout_query]

    #Here we check if the bag is booked for the checkin/checkout query




    # ========================================================

    if params[:checkin_query].empty? || params[:checkout_query].empty?
      @bags = Bag.search(params[:query]).where.not(latitude: nil, longitude: nil)
    else
      @bags = Bag.search(params[:query]).where("datein <= :start_date AND dateout >= :end_date", {start_date: Date.parse(@checkin), end_date: Date.parse(@checkout)}).where.not(latitude: nil, longitude: nil)
      #Here we check if the bag is booked for the checkin/checkout query
      # @epoch = Date.new(1970,1,1)

      date_checkin = Date.parse(@checkin)
      date_checkout = Date.parse(@checkout)


      @dates_array = (date_checkin..date_checkout).to_a

      # @dates_array_epoch = []

      # @dates_array.each do |date|
      #   @dates_array_epoch << (date - @epoch).to_i
      # end
    end

   end

  def show
    @bag_coordinates = { lat: @bag.latitude, lng: @bag.longitude }
    @booking = Booking.new
    @checkin = params[:checkin_query]
    @checkout = params[:checkout_query]

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
    params.require(:bag).permit(:title, :category, :brand, :capacity, :price_per_day, :description, :address, :latitude, :longitude, :datein, :dateout, photos: [])
  end
end

