class FishingPlanFishType < ApplicationRecord
  belongs_to :fishing_plan
  belongs_to :fish_type
end
