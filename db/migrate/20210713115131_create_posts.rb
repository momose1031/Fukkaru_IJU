class CreatePosts < ActiveRecord::Migration[5.2]
  def change
    create_table :posts do |t|
      t.integer :customer_id
      t.string :title, null: false
      t.text :body, null: false
      t.string :image_id, null: false
      t.integer :category, null: false
      t.string :location, null: false

      t.timestamps
    end
  end
end
