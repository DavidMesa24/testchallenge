class Transaction < ActiveRecord::Migration[5.2]
  def change
    create_table :transactions do |t|
      t.integer :ride_id
      t.integer :driver_id
      t.integer :rider_id
      t.decimal :amount
      t.string :status
      t.timestamps
    end
  end
end
