class AddSlugToReport < ActiveRecord::Migration
  def change
    add_column :reports, :slug, :string, null: false
    change_column_null :reports, :url, false
  end
end
