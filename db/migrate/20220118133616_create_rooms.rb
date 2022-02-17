class CreateRooms < ActiveRecord::Migration[7.0]
  def change
    create_table :rooms do |t|
      t.string :name
      t.string :introduction
      t.string :price
      t.string :address
      t.string :icon

      t.timestamps
    end
  end
end
