class CreateArticles < ActiveRecord::Migration
  def change
    create_table :articles do |t|
      t.string :title
      t.text :description
      t.integer :user_id

      t.timestamps
    end
    add_index :articles, :user_id
  end
end
