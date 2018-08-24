class CreateInsurances < ActiveRecord::Migration[4.2]
  def change
    create_table :insurances do |t|
      t.string :name
      t.string :other_detail
    end
  end
end
