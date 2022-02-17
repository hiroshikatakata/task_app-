class RemoveMailToUsers < ActiveRecord::Migration[7.0]
  def change
    remove_column :users, :mail, :string
  end
end
