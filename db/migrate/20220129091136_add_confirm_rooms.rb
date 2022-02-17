class AddConfirmRooms < ActiveRecord::Migration[7.0]
  def change
    add_column :rooms, :confirm, :string
  end
end
