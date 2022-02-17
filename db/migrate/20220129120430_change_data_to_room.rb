class ChangeDataToRoom < ActiveRecord::Migration[7.0]
  def change
    change_column :rooms, :start_date, :date

    change_column :rooms, :end_date, :date
  end
end
