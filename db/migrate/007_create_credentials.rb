class CreateCredentials < ActiveRecord::Migration[4.2]
  def change
    create_table :credentials do |t|
      t.string :username
      t.string :password
      t.boolean :admin?
      t.integer :other_id
      # t.string :password
    end
  end
end
