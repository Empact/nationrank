class AddShortNameToOrganizations < ActiveRecord::Migration
  def change
    add_column :organizations, :short_name, :string
    add_index :organizations, :short_name, unique: true
  end
end
