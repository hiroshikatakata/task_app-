class CreateUsers < ActiveRecord::Migration[7.0]
  def change
    create_table :users do |t|
      t.string :name
      t.string :mail
      t.string :key
      t.text :introduction
      t.string :icon

      t.timestamps
    end
  end
end
