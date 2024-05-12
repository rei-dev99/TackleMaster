class Lure < ApplicationRecord
  has_many :tackles_lures
  has_many :tackles, through: :tackles_lines
end
