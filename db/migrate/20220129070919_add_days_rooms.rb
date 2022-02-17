class AddDaysRooms < ActiveRecord::Migration[7.0]
  def change
    add_column :rooms, :days, :integer
  end
end
