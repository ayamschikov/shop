class AddOrderState < ActiveRecord::Migration[5.2]
  def up 
    remove_column :orders, :isDeleted
    add_column :orders, :aasm_state, :string

    Order.where(aasm_state: nil).update_all(aasm_state: "actual")
  end

  def down 
    add_column :orders, :isDeleted, :boolean
    remove_column :orders, :aasm_state
  end
end
