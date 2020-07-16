class Homecook < ApplicationRecord
  belongs_to :user
  has_many_attached :photos
  acts_as_taggable_on :tags
end
