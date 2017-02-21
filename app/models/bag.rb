class Bag < ApplicationRecord
  has_many :bookings
  belongs_to :user

  def self.search(pattern)
    if pattern.blank?  # blank? covers both nil and empty string
      all
    else
      where('brand LIKE ? OR category LIKE ?', "%#{pattern.capitalize}%", "%#{pattern.capitalize}%")
    end
  end

end
