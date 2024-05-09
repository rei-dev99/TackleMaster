class Tackle < ApplicationRecord
  belongs_to :user
  has_many :tackle_rods
  has_many :rods, through: :tackle_rods
  has_many :tackles_reels
  has_many :reels, through: :tackles_reels
  has_many :tackles_lines
  has_many :lines, through: :tackles_lines
  has_many :tackles_lures
  has_many :lures, through: :tackles_lures
end
