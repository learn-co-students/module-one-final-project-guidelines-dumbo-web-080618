class Admin < ActiveRecord::Migration[5.0]
  def change
    create_table :admins do |t|
      t.string :name
    end
  end
  #could create t.boolean :admin  if I set it to true it's an admin if not then you won't get access
  #come back to and might have to move this file until end so we don't migrate it ahead of time
end
