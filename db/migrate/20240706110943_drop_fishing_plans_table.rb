class DropFishingPlansTable < ActiveRecord::Migration[7.1]
  def up
    drop_table :fishing_plans
  end

  def down
    create_table :fishing_plans do |t|
      t.date :fishing_date, null: false
      t.string :location, null: false
      t.float :temperature
      t.float :wind_speed
      t.string :weather_condition
      t.float :precipitation_probability
      t.datetime :created_at, null: false
      t.datetime :updated_at, null: false
      t.integer :user_id
      t.string :fish_types, null: false
      t.integer :tackle_id
    end
  end
end
