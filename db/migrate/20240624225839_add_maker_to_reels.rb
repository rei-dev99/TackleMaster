class AddMakerToReels < ActiveRecord::Migration[7.1]
  def change
    add_column :reels, :maker, :string
  end
end
