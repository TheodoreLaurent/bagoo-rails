class BookingsController < ApplicationController
  before_action :set_bag

  def index
    @bookings = @bag.bookings
  end

  def show
  end

  def new
  end

  def create
  end

  private

  def set_bag
    @bag = Bag.find[:bag_id]
  end


end
