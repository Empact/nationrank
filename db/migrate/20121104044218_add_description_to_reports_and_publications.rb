class AddDescriptionToReportsAndPublications < ActiveRecord::Migration
  def change
    add_column :reports, :description, :text
    add_column :publications, :description, :text
  end
end
