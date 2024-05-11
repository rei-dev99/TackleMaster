class Line < ApplicationRecord
  has_many :tackles_lines
  has_many :tackles, throught: :tackles_lines
end
