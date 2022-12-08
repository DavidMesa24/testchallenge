class CreateTrips < ActiveRecord::Migration[5.2]
  def change
    create_table :trips do |t|

      t.integer :driver_id
      t.integer :rider_id
      t.decimal :current_latitude
      t.decimal :current_longitude
      t.decimal :final_latitude
      t.decimal :final_longitude
      t.decimal :charge
      t.boolean :paid_out
      t.string :status
      t.decimal :distance_km

      t.timestamps
    end
  end
end
