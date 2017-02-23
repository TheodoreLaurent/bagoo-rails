class Booking < ApplicationRecord
  belongs_to :bag
  belongs_to :user

  after_create :send_booking_message

  private

  def send_booking_message
    bag_name = self.bag.title
    customer = self.user
    owner = self.bag.user
    start_date = self.check_in
    end_date = self.check_out

    if customer.first_name.nil?
      customer.send_message(owner, "A user has requested to book your bag
       between #{start_date} - #{end_date}", "Booking request for - #{bag_name}")
    else
      customer.send_message(owner, "#{customer.first_name} has requested to book your bag
       between #{start_date} - #{end_date}", "Booking request for - #{bag_name}")
    end
  end
end

