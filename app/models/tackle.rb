class Tackle < ApplicationRecord
  belongs_to :user
  has_many :tackle_rods
  has_many :rods, through: :tackle_rods
  has_many :tackles_reels
  has_many :reels, through: :tackles_reels
end
