class Reel < ApplicationRecord
  enum gear_ratio: { C: 0, PG: 1, HG: 2, XG: 3 }
  has_many :tackles_reels
  has_many :tackles, through: :tackles_reels
end
