class CreateRankings < ActiveRecord::Migration
  def change
    create_table :ratings do |t|
      t.integer :score, null: false
      t.integer :rank, null: false
      t.integer :nation_id, null: false
      t.integer :publication_id, null: false

      t.timestamps
    end
    add_foreign_key :ratings, :nations
    add_foreign_key :ratings, :publications
    add_index :ratings, [:publication_id, :nation_id], unique: true
  end
end
