class Tackle < ApplicationRecord
  belongs_to :user

  has_many :tackle_rods, dependent: :destroy
  has_many :rods, through: :tackle_rods
  # formとコントローラーで中間テーブルで保存されるようにもできる
  accepts_nested_attributes_for :tackle_rods, allow_destroy: true

  has_many :tackle_reels, dependent: :destroy
  has_many :reels, through: :tackle_reels
  accepts_nested_attributes_for :tackle_reels

  has_many :tackle_accesories, dependent: :destroy
  has_many :accesories, through: :tackle_accesories
  accepts_nested_attributes_for :tackle_accesories

  has_many :fishing_plans, dependent: :destroy

  has_one_attached :image

  validates :name, presence: true, length: { maximum: 255 }
  validate :image_presence

  private

  def image_presence
    errors.add(:image, 'をアップロードしてください') unless image.attached?
  end
end
