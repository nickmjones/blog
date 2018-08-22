class AddMediaFieldToPostsAsString < ActiveRecord::Migration[5.2]
  def change
    add_column :posts, :media, :string
  end
end
