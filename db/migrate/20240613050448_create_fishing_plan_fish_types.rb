class CreateFishingPlanFishTypes < ActiveRecord::Migration[7.1]
  def change
    create_table :fishing_plan_fish_types do |t|
      t.references :fishing_plan, null: false, foreign_key: true
      t.references :fish_type, null: false, foreign_key: true

      t.timestamps
    end
  end
end
