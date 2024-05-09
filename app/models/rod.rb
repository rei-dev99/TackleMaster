class Rod < ApplicationRecord
  enum power: { L: 0, M: 1, H: 2 }
  has_many :tackle_rods
  has_many :tackles, through: :tackle_rods
end