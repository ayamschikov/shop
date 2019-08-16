class AddProductState < ActiveRecord::Migration[5.2]
  def up
    add_column :products, :aasm_state, :string
    Product.where(aasm_state: nil).update_all(aasm_state: "actual")
  end

  def down 
    remove_column :products, :aasm_state
  end
end