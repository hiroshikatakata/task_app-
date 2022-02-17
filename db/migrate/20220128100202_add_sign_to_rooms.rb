class AddSignToRooms < ActiveRecord::Migration[7.0]
  def change
    add_reference :rooms, :sign, index: true, foreign_key: true
  end
end
