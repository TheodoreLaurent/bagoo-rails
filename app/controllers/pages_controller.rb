class PagesController < ApplicationController
  skip_before_action :authenticate_user!, only: [:home, :results]

  def home
      @bags = Bag.all.where.not(latitude: nil, longitude: nil)
      @hash = Gmaps4rails.build_markers(@bags) do |bag, marker|
      marker.lat bag.latitude
      marker.lng bag.longitude
      marker.infowindow render_to_string(partial: "/bags/map_details", locals: { bag: bag })
    end
  end

  def profile
    @user = current_user
  end

  def bookings
    @user_id = current_user.id
    @bookings = Booking.where(user_id: @user_id)
  end

  def inbox
    @user = current_user
    @conversations = @user.mailbox.inbox
  end

  def message_show
    @user = current_user
    @conversations = @user.mailbox.inbox
    @conversations = @conversations.find(params[:id])
  end

  def dashboard
    @user = current_user
  end
end


# @conversations = @user.mailbox.inbox.first
#     @receipts = @conversations.receipts_for @user
