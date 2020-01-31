class CreateTemperatures < ActiveRecord::Migration[5.2]
  def change
    create_table :temperatures do |t|
      t.integer :temperature
      t.integer :room_id
      t.timestamps
    end
  end
end
