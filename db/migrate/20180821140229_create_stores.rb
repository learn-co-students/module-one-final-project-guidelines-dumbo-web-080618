class CreateStores < ActiveRecord::Migration[5.2]
  def change
    create_table :stores do |t|
      t.string :name
      t.string :location
      t.string :hours
      t.string :address
      t.string :specialty
    end
  end
end
