class AddReservationsicon < ActiveRecord::Migration[7.0]
  def change
    add_column :reservations, :icon, :string
    add_column :reservations, :introduction, :string
    add_column :reservations, :name, :string
  end
end
