class CreateDoctors < ActiveRecord::Migration[4.2]
  def change
    create_table :doctors do |t|
      t.string :first_name
      t.string :last_name
      t.string :gender
      t.string :specialties
    end
  end
end
