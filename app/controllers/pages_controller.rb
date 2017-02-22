class PagesController < ApplicationController
  skip_before_action :authenticate_user!, only: [:home, :results]

  def home
  end

  def profile
    @user = current_user
  end

  def bookings
    @user_id = current_user.id
    @bookings = Booking.where(user_id: @user_id)

  end

end


