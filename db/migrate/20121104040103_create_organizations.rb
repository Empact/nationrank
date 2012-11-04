class CreateOrganizations < ActiveRecord::Migration
  def change
    create_table :organizations do |t|
      t.string :name, null: false
      t.string :slug, null: false
      t.string :url, null: false
      t.integer :created_by_id, null: false

      t.timestamps
    end
    add_index :organizations, :slug
    add_foreign_key :organizations, :users, column: :created_by_id

    add_column :reports, :url, :string
  end
end
