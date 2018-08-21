class Admin < ActiveRecord::Migration[5.0]
  def change
    create_table :admins do |t|
      t.string :name
    end
  end
  #come back to and might have to move this file until end so we don't migrate it ahead of time
end
