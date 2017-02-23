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
    @booking.user = current_user
    @booking.accepted = false
    @booking.save

    redirect_to my_bookings_path
  end

  def accept
    @booking = Booking.find(params[:id])
    @booking.accepted = true
    request_dates_array = (@booking.check_in..@booking.check_out).to_a
    bag = @booking.bag
    bag.bookeddates = request_dates_array.push(*@booking.bag.bookeddates)

    bag.save
    @booking.save


    redirect_to dashboard_path
  end


  private

  def set_bag
    @bag = Bag.find(params[:bag_id])
  end

  def booking_params
    params.require(:booking).permit(:check_in, :check_out)
  end


end

