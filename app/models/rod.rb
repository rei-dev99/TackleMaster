class Rod < ApplicationRecord
  has_many :tackle_rods
  has_many :tackles, through: :tackle_rods

  validates :name, presence: true
  validates :maker, presence: true
  validates :memo, length: { maximum: 500 }

  has_one_attached :image
end
