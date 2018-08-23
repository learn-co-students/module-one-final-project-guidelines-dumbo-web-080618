class CreateActivities < ActiveRecord::Migration[5.0]
  def change
    create_table :activities do |t|
      t.string :name
      t.string :place
<<<<<<< HEAD
      t.string :genre
      t.integer :price
      t.integer :best_time
      t.string :date
=======
      t.string :type
      t.integer :price
      t.integer :time 
>>>>>>> d2d79fdc3c39b20e0e8ad27b0aca91d9cc19fac2
    end
  end
end
