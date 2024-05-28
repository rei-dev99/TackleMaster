class AddSuggestionCountToUsers < ActiveRecord::Migration[7.1]
  def change
    add_column :users, :suggestion_count, :integer, default: 0
  end
end
