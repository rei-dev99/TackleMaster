class Tackle < ApplicationRecord
  belongs_to :user

  has_many :tackle_rods, dependent: :destroy
  has_many :rods, through: :tackle_rods

  has_many :tackle_reels, dependent: :destroy
  has_many :reels, through: :tackle_reels

  has_many :tackle_accesories, dependent: :destroy
  has_many :accesories, through: :tackle_accesories

  has_one_attached :image

  validates :name, presence: true, length: { maximum: 255 }
end
