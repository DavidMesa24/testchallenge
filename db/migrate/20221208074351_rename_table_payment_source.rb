class RenameTablePaymentSource < ActiveRecord::Migration[5.2]
  def change
    rename_table :payment_source, :payment_sources
  end
end
