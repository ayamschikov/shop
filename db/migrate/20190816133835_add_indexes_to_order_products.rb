class AddIndexesToOrderProducts < ActiveRecord::Migration[5.2]
  def change
    add_index :order_products, [:order_id, :product_id], unique: true
  end
end
