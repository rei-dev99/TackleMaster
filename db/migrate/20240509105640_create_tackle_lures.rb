class CreateTackleLures < ActiveRecord::Migration[7.1]
  def change
    create_table :tackle_lures do |t|
      t.references :tackle, null: false, foreign_key: true
      t.references :lure, null: false, foreign_key: true

      t.timestamps
    end
  end
end
