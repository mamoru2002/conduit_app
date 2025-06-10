class AddIndexAndForeignKeyToArticlesUser < ActiveRecord::Migration[7.1] # Railsのバージョンによって数字が異なる
  def change
    # articlesテーブルのuser_idにインデックスを追加
    add_index :articles, :user_id

    # articlesテーブルのuser_idがusersテーブルのidを参照する外部キーを設定
    add_foreign_key :articles, :users
  end
end
