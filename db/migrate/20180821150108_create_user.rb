class CreateUser < ActiveRecord::Migration[5.0]
  def change
    create_table :users do |t|
      t.string :name
<<<<<<< HEAD
      t.string :email
=======
      t.integer :max_price_range
>>>>>>> d2d79fdc3c39b20e0e8ad27b0aca91d9cc19fac2
    end
  end
end
