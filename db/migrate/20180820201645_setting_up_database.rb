class SettingUpDatabase < ActiveRecord::Migration[5.0]
  def change
    create_table :users do |t|
      t.string :name
    end

    create_table :decks do |t|
      t.integer :user_id
      t.integer :question_id
    end

    create_table :questions do |t|
      t.string :category
      t.text :question
      t.string :answer
    end

  end
end
