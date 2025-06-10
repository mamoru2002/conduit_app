class AddTagListToArticles < ActiveRecord::Migration[7.2]
  def change
    add_column :articles, :tag_list, :string
  end
end
