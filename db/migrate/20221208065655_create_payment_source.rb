class CreatePaymentSource < ActiveRecord::Migration[5.2]
  def change
    create_table :payment_source do |t|
      t.integer :payment_source_id
      t.string :method

      t.timestamp :created_at
      t.timestamp :updated_at
    end
  end
end
