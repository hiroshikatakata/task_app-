class AddColumnRooms < ActiveRecord::Migration[7.0]
  def change
    add_column :rooms, :start_date, :datetime

    add_column :rooms, :end_date, :datetime

    add_column :rooms, :number, :integer

    add_column :rooms, :cost, :integer
  end
end
