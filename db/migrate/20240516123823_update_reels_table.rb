class UpdateReelsTable < ActiveRecord::Migration[7.1]
  def change
    remove_column :reels, :year, :integer
    remove_column :reels, :gear_ratio, :integer
    remove_column :reels, :length, :integer
    add_column :reels, :memo, :text
  end
end
