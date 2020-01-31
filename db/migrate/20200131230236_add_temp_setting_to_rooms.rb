class AddTempSettingToRooms < ActiveRecord::Migration[5.2]
  def change
    add_column :rooms, :temp_setting, :integer
  end
end
