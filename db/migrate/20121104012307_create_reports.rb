class CreateReports < ActiveRecord::Migration
  def change
    create_table :reports do |t|
      t.integer :organization_id
      t.integer :created_by_id, null: false
      t.string :name, null: false

      t.timestamps
    end
    add_index :reports, :organization_id
    add_index :reports, :created_by_id
  end
end
