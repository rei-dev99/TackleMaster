class AddFishTypeToFishingPlans < ActiveRecord::Migration[7.1]
  def change
    add_column :fishing_plans, :fish_types, :string, null: false
  end
end
