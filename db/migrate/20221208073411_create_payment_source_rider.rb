class CreatePaymentSourceRider < ActiveRecord::Migration[5.2]
  def change
    add_column :riders, :payment_source_id, :integer
  end
end
