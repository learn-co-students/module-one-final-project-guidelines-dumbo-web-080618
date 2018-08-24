class Legislator < ActiveRecord::Migration[5.0]
  def change
      create_table :legislators do |t|
        t.string :last_name
        t.string :first_name
        t.string :birthday
        t.string :gender
        t.string :title
        t.string :state
        t.integer :district
        t.string :party
        t.string :url
        t.string :address
        t.integer :phone
      end
  end
end
