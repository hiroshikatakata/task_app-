class AddReferencesToUsers < ActiveRecord::Migration[7.0]
  def change
    add_reference :users, :sign, foreign_key: true
  end
end
