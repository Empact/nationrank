class AddSummaryAndAuthorsToPublications < ActiveRecord::Migration
  def change
    add_column :publications, :authors, :text
    rename_column :publications, :description, :summary
  end
end
