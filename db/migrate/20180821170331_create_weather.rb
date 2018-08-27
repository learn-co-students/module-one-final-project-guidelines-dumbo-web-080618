class CreateWeather < ActiveRecord::Migration[5.0]
  def change
    create_table :weathers do |t|
      t.string :condition
    end
  end
end
