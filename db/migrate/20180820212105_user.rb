class User < ActiveRecord::Migration[5.0]
  def change
    create_table :users do |t|
      t.string :name
      t.integer :age
      t.string :gender
      t.string :party
      t.timestamps
    end
    #should I include a donation column with and id to track all user donations?
    #if i have a donations table I should be able to keep track of all user donations there
  end
end
