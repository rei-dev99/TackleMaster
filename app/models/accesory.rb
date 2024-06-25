class Accesory < ApplicationRecord
  has_many :tackle_accesories
  has_many :tackles, through: :tackle_accesories

  validates :name, presence: true
  validates :maker, presence: true
  validates :memo, length: { maximum: 500 }

  has_one_attached :image

  validate :image_presence

  private

  def image_presence
    errors.add(:image, '小物画像をアップロードしてください') unless image.attached?
  end
end
