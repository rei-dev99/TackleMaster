class UpdateRodsTable < ActiveRecord::Migration[7.1]
  def change
    remove_column :rods, :year, :integer
    remove_column :rods, :power, :integer
    remove_column :rods, :length, :integer
    add_column :rods, :memo, :text
  end
end
