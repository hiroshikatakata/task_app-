class ChangeDataIconToUser < ActiveRecord::Migration[7.0]
  def change
    change_column :users, :icon, :binary
  end
end
