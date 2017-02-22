class BookingsController < ApplicationController
  before_action :set_bag, only: [:create, :new]

  def index
    @bookings = @bag.bookings
  end

  def show
    @booking = Booking.find(params[:id])
  end

  def new
    @booking = Booking.new
  end

  def create
    @booking = Booking.new(booking_params)
    @booking.bag = @bag
    @booking.save

  end

  private

  def set_bag
    @bag = Bag.find(params[:bag_id])
  end

  def booking_params
    params.require(:booking).permit(:check_in, :check_out, :total_price, :rating, :content)
  end


end
