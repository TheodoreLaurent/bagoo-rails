class Bag < ApplicationRecord
  has_attachments :photos, maximum: 6

  has_many :bookings, dependent: :destroy
  belongs_to :user

  def self.search(pattern)
    if pattern.blank?  # blank? covers both nil and empty string
      all
    else
      where('brand LIKE ? OR category LIKE ?', "%#{pattern.capitalize}%", "%#{pattern.capitalize}%")
    end
  end

end
