class CreateReviews < ActiveRecord::Migration[6.1]
  def change
    create_table :reviews do |t|
      t.integer :post_id, null: false
      t.integer :customer_id, null: false
      t.string :content
      t.integer :score
      
      t.timestamps
    end
  end
end
