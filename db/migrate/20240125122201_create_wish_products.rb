class CreateWishProducts < ActiveRecord::Migration[7.0]
  def change
    create_table :wish_products do |t|
      t.integer :product_id
      t.integer :wish_id
      t.integer :count

      t.timestamps
    end
  end
end
