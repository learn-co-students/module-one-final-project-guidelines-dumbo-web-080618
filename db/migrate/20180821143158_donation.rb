class Donation < ActiveRecord::Migration[5.0]
  def change
    create_table :donations do |t|
      t.integer :user_id
      t.integer :representative_id
      t.integer :amount
      t.timestamps
    end
  end
end
