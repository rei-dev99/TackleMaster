class Tackle < ApplicationRecord
  belongs_to :user

  has_many :tackle_rods
  has_many :rods, through: :tackle_rods
  accepts_nested_attributes_for :tackle_rods

  has_many :tackle_reels
  has_many :reels, through: :tackle_reels
  accepts_nested_attributes_for :tackle_reels

  validates :name, presence: true, length: { maximum: 255 }
end
