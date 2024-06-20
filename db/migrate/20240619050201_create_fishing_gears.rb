class CreateFishingGears < ActiveRecord::Migration[7.1]
  def change
    create_table :fishing_gears do |t|
      t.string :fish_type
      t.string :budget
      t.string :location
      t.string :fishing_type
      t.string :tackle_type
      t.string :tackle_maker
      t.string :skill_level
      t.text :memo
      t.text :suggestion
      t.references :user, null: false, foreign_key: true

      t.timestamps
    end
  end
end
