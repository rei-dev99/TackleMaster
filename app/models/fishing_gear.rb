class FishingGear < ApplicationRecord
  belongs_to :user

  validates :fish_type, presence: true
  validates :budget, presence: true
  validates :location, presence: true
  validates :fishing_type, presence: true
  validates :tackle_type, presence: true
  validates :tackle_maker, presence: true
  validates :skill_level, presence: true
end
