class UseDecimalColumnForScores < ActiveRecord::Migration
  def change
    change_column :ratings, :score, :decimal, scale: 3, precision: 13, null: false
  end
end
