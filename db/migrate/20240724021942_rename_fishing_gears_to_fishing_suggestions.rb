class RenameFishingGearsToFishingSuggestions < ActiveRecord::Migration[7.1]
  def change
    rename_table :fishing_gears, :fishing_suggestions
  end
end
