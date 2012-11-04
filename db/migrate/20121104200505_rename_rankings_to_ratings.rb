class RenameRankingsToRatings < ActiveRecord::Migration
  def change
    rename_table :ratings, :ratings
  end
end
