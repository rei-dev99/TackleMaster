class Reel < ApplicationRecord
  has_many :tackles_reels
  has_many :tackles, through: :tackles_reels

  validates :name, presence: true
  validates :memo, length: { maximum: 500 }

  has_one_attached :image
end
