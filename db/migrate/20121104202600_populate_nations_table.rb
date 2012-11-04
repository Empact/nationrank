class PopulateNationsTable < ActiveRecord::Migration
  def up
    ActionView::Helpers::FormOptionsHelper::COUNTRIES.each do |country_name|
      Nation.create!(name: country_name)
    end
  end

  def down
    Rating.delete_all
    Nation.delete_all
  end
end
