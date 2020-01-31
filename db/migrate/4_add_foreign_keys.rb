class AddForeignKeys < ActiveRecord::Migration[5.2]
  def change
    add_foreign_key :rooms, :homes
    add_foreign_key :temperatures, :rooms
  end
end
