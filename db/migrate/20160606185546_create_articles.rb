class CreateArticles < ActiveRecord::Migration
  def change
    create_table :articles do |t|

      t.string :name
      t.string :url
      t.string :country_name

    end
  end
end
