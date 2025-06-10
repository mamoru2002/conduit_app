class AddDescriptionToArticles < ActiveRecord::Migration[7.2]
  def change
    add_column :articles, :description, :text
  end
end
