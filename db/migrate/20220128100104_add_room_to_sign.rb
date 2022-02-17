class AddRoomToSign < ActiveRecord::Migration[7.0]
  def change
    add_reference :signs, :room, index: true, foreign_key: true
  end
end
