class Reservation < ApplicationRecord
  belongs_to :user
  belongs_to :homecook

  validates :datetime, :address, :capacity, presence: true
  validates :capacity, numericality: { only_integer: true, greater_than_or_equal_to: 1 }
end
