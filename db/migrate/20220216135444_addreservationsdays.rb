class Addreservationsdays < ActiveRecord::Migration[7.0]
  def change
    add_column :reservations, :days, :integer
  end
end
