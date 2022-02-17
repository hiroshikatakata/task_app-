class ChangeDataIconToSign < ActiveRecord::Migration[7.0]
  def change
    change_column :signs, :icon, :string
  end
end
