class Homecook < ApplicationRecord
  belongs_to :user
  has_many :reservations, dependent: :destroy
  has_many_attached :photos
  acts_as_taggable_on :tags

  validates :price_per_person, presence: true, numericality: { only_integer: true}
end
