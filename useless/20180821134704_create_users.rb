class CreateUsers < ActiveRecord::Migration[5.2]
  def change
    create_table :users do |t|
      t.string :name
      t.string :gender
      t.integer :age
      t.integer :size
      t.string :style
      t.string :location
    end
  end
end
