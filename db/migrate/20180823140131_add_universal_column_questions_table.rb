class AddUniversalColumnQuestionsTable < ActiveRecord::Migration[5.2]
  def change
    add_column :questions, :universal, :boolean, :default => 0
  end
end
