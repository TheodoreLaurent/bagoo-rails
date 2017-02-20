class Booking < ApplicationRecord
  belongs_to :bag
  belongs_to :user
end
