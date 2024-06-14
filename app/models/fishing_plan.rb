class FishingPlan < ApplicationRecord
  has_many :fishing_plan_tackles, dependent: :destroy
  has_many :tackles, through: :fishing_plan_tackles
  belongs_to :user

  validates :fishing_date, presence: true
  validates :location, presence: true

  def not_past_date
    if fishing_date.present? && fishing_date < Date.today
        errors.add(:fishing_date, "過去の日付は登録できません。")
    end
  end
end
