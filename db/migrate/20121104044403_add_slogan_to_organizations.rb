class AddSloganToOrganizations < ActiveRecord::Migration
  def change
    add_column :organizations, :slogan, :string
  end
end
