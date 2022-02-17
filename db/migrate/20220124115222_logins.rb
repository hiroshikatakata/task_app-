class Logins < ActiveRecord::Migration[7.0]
  def change
    drop_table :logins
  end
end
