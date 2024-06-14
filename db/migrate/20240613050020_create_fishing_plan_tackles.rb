class CreateFishingPlanTackles < ActiveRecord::Migration[7.1]
  def change
    create_table :fishing_plan_tackles do |t|
      t.references :fishing_plan, null: false, foreign_key: true
      t.references :tackle, null: false, foreign_key: true

      t.timestamps
    end
  end
end
