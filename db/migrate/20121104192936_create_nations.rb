class CreateNations < ActiveRecord::Migration
  def change
    create_table :nations do |t|
      t.string :name, null: false
      t.string :slug, null: false

      t.timestamps
    end
    add_index :nations, :name, unique: true
    add_index :nations, :slug, unique: true
  end
end
