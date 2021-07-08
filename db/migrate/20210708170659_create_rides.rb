class CreateRides < ActiveRecord::Migration[5.2]
  def change
    create_table :rides do |t|
      t.integer :driver_id
      t.integer :passenger_id
      t.float :price
      t.string :pick_up
      t.string :drop_off
    end
  end
end
