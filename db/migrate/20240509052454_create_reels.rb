class CreateReels < ActiveRecord::Migration[7.1]
  def change
    create_table :reels do |t|
      t.string :name
      t.integer :year
      t.integer :gear_ratio
      t.integer :length

      t.timestamps
    end
  end
end
