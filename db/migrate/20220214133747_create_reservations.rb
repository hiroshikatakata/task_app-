class CreateReservations < ActiveRecord::Migration[7.0]
  def change
    create_table :reservations do |t|
      t.integer :sign_id
      t.integer :room_id

      t.timestamps
    end
  end
end
