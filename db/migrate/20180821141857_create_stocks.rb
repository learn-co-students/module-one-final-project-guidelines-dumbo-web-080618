class CreateStocks < ActiveRecord::Migration[5.2]
  def change
    create_table :stocks do |t|
      t.integer :store_id
      t.integer :shoe_id
      t.integer :price
      t.integer :quantity
    end
  end
end
