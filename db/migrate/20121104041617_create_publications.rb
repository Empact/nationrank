class CreatePublications < ActiveRecord::Migration
  def change
    create_table :publications do |t|
      t.integer :report_id, null: false
      t.string :name, null: false
      t.string :slug, null: false
      t.string :url, null: false

      t.timestamps
    end
    add_foreign_key :publications, :reports
    add_index :publications, :report_id
  end
end
