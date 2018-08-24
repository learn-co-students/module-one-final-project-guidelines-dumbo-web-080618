class CreateClaims < ActiveRecord::Migration[4.2]
  def change
    create_table :claims do |t|
      t.string :stuff
    end
  end
end
