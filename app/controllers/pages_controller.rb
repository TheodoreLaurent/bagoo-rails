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

  def inbox
    @user = current_user
    @conversations = @user.mailbox.inbox
  end

  def message_show
    @user = current_user
    @conversations = @user.mailbox.inbox
    @conversations = @conversations.find(params[:id])
  end

end


# @conversations = @user.mailbox.inbox.first
#     @receipts = @conversations.receipts_for @user
