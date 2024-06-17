class CreateFishingPlans < ActiveRecord::Migration[7.1]
  def change
    create_table :fishing_plans do |t|
      t.date :fishing_date, null: false
      t.string :location, null: false
      t.float :temperature
      t.float :wind_speed
      t.string :weather_condition
      t.float :precipitation_probability

      t.timestamps
    end
  end
end
