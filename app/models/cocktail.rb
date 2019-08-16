class Cocktail < ApplicationRecord
  has_many :doses, dependent: :destroy
  has_many :ingredients, through: :doses
  validates :photo, presence: true
  mount_uploader :photo, PhotoUploader

  validates :name, presence: true, uniqueness: true, allow_blank: false
end
