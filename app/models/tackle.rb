class Tackle < ApplicationRecord
  belongs_to :user
  has_many :tackle_rods
  has_many :rods, throught: :tackle_rods
  has_many :tackles_reels
  has_many :reels, throught: :tackles_reels
  has_many :tackles_lines
  has_many :lines, throught: :tackles_lines
  has_many :tackles_lures
  has_many :lures, throught: :tackles_lures

  validates :name, presence: true, length: { maximum: 255 }
end
