class AddSluggifiedNameToCountries < ActiveRecord::Migration
  def change
    add_column :countries, :slug_name, :string
  end
end
