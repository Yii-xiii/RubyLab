class CreateOrders < ActiveRecord::Migration[6.1]
  def change
    create_table :orders do |t|
      t.references :customer, null: false, foreign_key: {to_table: :users}
      t.string :name
      t.text :address
      t.string :phone_number
      t.string :postcode
      t.integer :status

      t.timestamps
    end
  end
end
