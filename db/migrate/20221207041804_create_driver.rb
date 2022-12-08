class CreateDriver < ActiveRecord::Migration[5.2]
  def change
    create_table :drivers do |t|
      t.string :first_name
      t.string :last_name
      t.string :email
      t.string :status
      t.string :country
      t.string :state
      t.string :city
      t.integer :age
      t.decimal :current_latitude
      t.decimal :current_longitude
      t.timestamps
    end
  end
end
