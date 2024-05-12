class CreateRods < ActiveRecord::Migration[7.1]
  def change
    create_table :rods do |t|
      t.string :name
      t.integer :year
      t.integer :power
      t.integer :length

      t.timestamps
    end
  end
end
