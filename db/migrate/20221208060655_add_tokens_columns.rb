class AddTokensColumns < ActiveRecord::Migration[5.2]
  def change
    add_column :drivers, :token, :string
    add_column :riders, :token, :string
    add_column :drivers, :acceptance_token, :string
    add_column :riders, :acceptance_token, :string
    add_column :drivers, :payment_method, :string
    add_column :riders, :payment_method, :string

  end
end
