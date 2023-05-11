class CreateGrowRooms < ActiveRecord::Migration[7.0]
  def change
    create_table :grow_rooms do |t|
      t.string :name
      t.boolean :is_flower
      t.integer :plant_capacity
      
      t.timestamps
    end
  end
end
