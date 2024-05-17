class CreateTackleAccesories < ActiveRecord::Migration[7.1]
  def change
    create_table :tackle_accesories do |t|
      t.references :tackle, null: false, foreign_key: true
      t.references :accesory, null: false, foreign_key: true

      t.timestamps
    end
  end
end
