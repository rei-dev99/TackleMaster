class Lure < ApplicationRecord
  has_many :tackles_lures
  has_many :tackles, throught: :tackles_lines
end
