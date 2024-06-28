class AddMakerToAccesories < ActiveRecord::Migration[7.1]
  def change
    add_column :accesories, :maker, :string
  end
end
