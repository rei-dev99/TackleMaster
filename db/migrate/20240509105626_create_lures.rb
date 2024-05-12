class CreateLures < ActiveRecord::Migration[7.1]
  def change
    create_table :lures do |t|
      t.string :name
      t.string :kind
      t.integer :lure_weight
      t.string :color

      t.timestamps
    end
  end
end
