class RenameKeyColumnToPasswordDigest < ActiveRecord::Migration[7.0]
  def change
    rename_column :users, :key, :password_digest
  end
end
