class CreateTackleRods < ActiveRecord::Migration[7.1]
  def change
    create_table :tackle_rods do |t|
      t.references :tackle, null: false, foreign_key: true
      t.references :rod, null: false, foreign_key: true

      t.timestamps
    end
  end
end
