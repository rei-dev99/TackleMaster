class AddMakerToRods < ActiveRecord::Migration[7.1]
  def change
    add_column :rods, :maker, :string
  end
end
