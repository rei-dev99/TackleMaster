class Rod < ApplicationRecord
  has_many :tackle_rods
  has_many :tackles, through: :tackle_rods

  validates :name, presence: true
  validates :memo, length: { maximum: 500 }

  has_one_attached :image

  validate :image_presence

  private

  def image_presence
    errors.add(:image, 'ロッド画像をアップロードしてください') unless image.attached?
  end
end
