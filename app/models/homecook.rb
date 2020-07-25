class Homecook < ApplicationRecord
  CUISINES = [ "Chinese", "Japanese", "Italian", "French", "Brazilian" ]
  belongs_to :user
  has_many :reservations, dependent: :destroy
  has_many :reviews, dependent: :destroy
  has_many_attached :photos
  acts_as_taggable_on :tags

  include PgSearch::Model
  pg_search_scope :search_info,
    against: [:price_per_person, :introduction],

    associated_against: {
      user: [:name, :address],
      tags: [:name]
    },
    using: {
      tsearch: { prefix: true } # <-- now `superman batm` will return something!
    }

  validates :price_per_person, presence: true, numericality: { only_integer: true}
  validates :user_id, uniqueness: true
end
