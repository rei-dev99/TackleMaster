class AddTackleIdToFishingPlans < ActiveRecord::Migration[7.1]
  def change
    add_column :fishing_plans, :tackle_id, :integer
    add_foreign_key :fishing_plans, :tackles
  end
end
