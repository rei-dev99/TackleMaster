class CreateLines < ActiveRecord::Migration[7.1]
  def change
    create_table :lines do |t|
      t.string :name
      t.string :kind
      t.integer :line_weight
      t.integer :length

      t.timestamps
    end
  end
end
