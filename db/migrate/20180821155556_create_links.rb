class CreateLinks < ActiveRecord::Migration[5.2]
  def change
    create_table :links do |t|
      t.text :body
      t.string :attribution

      t.timestamps
    end
  end
end
