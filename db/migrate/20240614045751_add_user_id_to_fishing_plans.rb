class AddUserIdToFishingPlans < ActiveRecord::Migration[7.1]
  def change
    add_column :fishing_plans, :user_id, :integer
  end
end
