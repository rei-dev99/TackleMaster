class Tackle < ApplicationRecord
  belongs_to :user
  has_many :tackle_rods
  has_many :rods, through: :tackle_rods
end
