class Bag < ApplicationRecord
  has_attachments :photos, maximum: 6

  has_many :bookings
  belongs_to :user

end
