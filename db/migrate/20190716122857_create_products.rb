class CreateProducts < ActiveRecord::Migration[5.2]
  def change
    create_table :products do |t|
      t.string :name
      t.monetize :price
      t.integer :amount
      t.string :short_description
      t.text :full_description

      t.timestamps
    end
  end
end
