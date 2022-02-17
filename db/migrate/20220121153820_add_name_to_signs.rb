class AddNameToSigns < ActiveRecord::Migration[7.0]
  def change
    add_column :signs, :name, :string
  end
end
