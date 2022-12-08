class RenameTableTrips < ActiveRecord::Migration[5.2]
  def change
    rename_table :trips, :rides
  end
end
