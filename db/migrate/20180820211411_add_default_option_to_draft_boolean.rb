class AddDefaultOptionToDraftBoolean < ActiveRecord::Migration[5.2]
  def change
    change_column :posts, :is_draft, :boolean, :default => false
  end
end
