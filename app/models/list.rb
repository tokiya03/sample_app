class List < ApplicationRecord
  has_one_attached :image

  validates :title, presence: true
  validates :bosy, presence: true
  validates :image, presence: true
end
