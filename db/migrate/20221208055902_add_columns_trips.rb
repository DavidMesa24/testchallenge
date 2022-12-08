class AddColumnsTrips < ActiveRecord::Migration[5.2]
  def change
    add_column :trips, :base_fee, :decimal
    add_column :trips, :duration, :decimal
  end
end
