class AddCityToPosts < ActiveRecord::Migration[5.2]
  def change
    add_column :posts, :city, :string, :default => 'Washington, DC'
  end
end
