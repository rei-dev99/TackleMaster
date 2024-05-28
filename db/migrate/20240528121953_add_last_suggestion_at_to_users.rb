class AddLastSuggestionAtToUsers < ActiveRecord::Migration[7.1]
  def change
    add_column :users, :last_suggestion_at, :datetime
  end
end
