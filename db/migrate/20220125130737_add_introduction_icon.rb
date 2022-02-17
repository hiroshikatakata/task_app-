class AddIntroductionIcon < ActiveRecord::Migration[7.0]
  def change
    add_column :signs, :introduction, :text
    add_column :signs, :icon, :binary
  end
end
