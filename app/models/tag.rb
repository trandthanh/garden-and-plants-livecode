class Tag < ApplicationRecord
  has_many :plant_tags
  has_many :plants, through: :plant_tags

  validates :name, presence: true, uniqueness: true
end
