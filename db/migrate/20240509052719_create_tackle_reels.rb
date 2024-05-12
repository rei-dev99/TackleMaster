class CreateTackleReels < ActiveRecord::Migration[7.1]
  def change
    create_table :tackle_reels do |t|
      t.references :tackle, null: false, foreign_key: true
      t.references :reel, null: false, foreign_key: true

      t.timestamps
    end
  end
end
