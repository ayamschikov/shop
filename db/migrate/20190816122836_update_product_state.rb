class UpdateProductState < ActiveRecord::Migration[5.2]
  def up
    Product.where(aasm_state: nil).update_all(aasm_state: "actual")
  end

  def down
  end
end
