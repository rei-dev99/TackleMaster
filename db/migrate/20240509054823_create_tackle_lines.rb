class CreateTackleLines < ActiveRecord::Migration[7.1]
  def change
    create_table :tackle_lines do |t|
      t.references :tackle, null: false, foreign_key: true
      t.references :line, null: false, foreign_key: true

      t.timestamps
    end
  end
end
