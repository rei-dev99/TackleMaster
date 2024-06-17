class FishingPlan < ApplicationRecord
  belongs_to :tackle
  belongs_to :user

  validates :fishing_date, presence: true
  validates :location, presence: true

  def not_past_date
    return unless fishing_date.present? && fishing_date < Date.today

    errors.add(:fishing_date, "過去の日付は登録できません。")
  end
end
