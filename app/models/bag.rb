class Bag < ApplicationRecord
  has_attachments :photos, maximum: 6
  validates :address, presence: true

  has_many :bookings, dependent: :destroy
  belongs_to :user

  geocoded_by :address
  after_validation :geocode, if: :address_changed?

  def self.search(pattern)
    if pattern.blank?  # blank? covers both nil and empty string
      all
    else
      where('category LIKE ?', "%#{pattern}%")
    end
  end

end
