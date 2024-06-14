class FishType < ApplicationRecord
  has_many :fishing_plan_fish_types
  has_many :fishing_plans, through: :fishing_plan_fish_types
end
