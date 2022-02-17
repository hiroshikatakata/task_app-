class AddColumRoom < ActiveRecord::Migration[7.0]
  def change
    add_column :rooms, :sign_id_check, :integer
  end
end
