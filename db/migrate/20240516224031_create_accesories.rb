class CreateAccesories < ActiveRecord::Migration[7.1]
  def change
    create_table :accesories do |t|
      t.string :name, null: false
      t.text :memo

      t.timestamps
    end
  end
end
