class Reel < ApplicationRecord
  has_many :tackle_reels
  has_many :tackles, through: :tackle_reels

  validates :name, presence: true
  validates :maker, presence: true
  validates :memo, length: { maximum: 500 }

  has_one_attached :image
end
