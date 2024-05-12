class Line < ApplicationRecord
  has_many :tackles_lines
  has_many :tackles, through: :tackles_lines
end
