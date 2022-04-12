class CreatePosts < ActiveRecord::Migration[6.1]
  def change
    create_table :posts do |t|
      t.integer :genre_id, null: false
      t.integer :customer_id, null: false
      t.string :restaurant_name
      t.string :title, null: false
      t.text :introduction
      t.string :phone_number
      t.text :address
      t.timestamps
    end
  end
end
