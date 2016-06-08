class CreateArticlesUsers < ActiveRecord::Migration
  def change
    create_table :articles_users do |t|
      t.integer :user_id
      t.integer :article_id
    end
  end
end
