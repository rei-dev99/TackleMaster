class Accesory < ApplicationRecord
  has_many :tackle_accesories
  has_many :tackles, through: :tackle_accesories

  validates :name, presence: true
  validates :memo, length: { maximum: 500 }

  has_one_attached :image
end
