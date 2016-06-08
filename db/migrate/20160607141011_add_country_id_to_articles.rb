class AddCountryIdToArticles < ActiveRecord::Migration
  def change

    add_column :articles, :country_id, :integer
  end
  
end
