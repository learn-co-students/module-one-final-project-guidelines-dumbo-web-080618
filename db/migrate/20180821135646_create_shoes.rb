class CreateShoes < ActiveRecord::Migration[5.2]
  def change
    create_table :shoes do |t|
      t.integer :size
      t.string :color
      t.string :brand
      t.string :item_id
      t.string :model
      t.string :style
      t.integer :msrp
    end
  end
end
