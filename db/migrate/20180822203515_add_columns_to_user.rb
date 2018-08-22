class AddColumnsToUser < ActiveRecord::Migration[5.2]
  def change
    add_column :users, :total_taken, :integer, :default => 0
    add_column :users, :total_correct, :integer, :default => 0
  end
end
