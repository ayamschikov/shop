class AddOrderState < ActiveRecord::Migration[5.2]
  def change 
    remove_column :orders, :isDeleted, :boolean
    add_column :orders, :aasm_state, :string
  end
end
