class CreateHospitals < ActiveRecord::Migration[4.2]
  def change
    create_table :hospitals do |t|
      t.string :name
      t.string :location
      t.string :hospital_type
      t.integer :rating
    end
  end
end
