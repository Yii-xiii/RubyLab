class CreateProductOrders < ActiveRecord::Migration[6.1]
  def change
    create_table :product_orders do |t|
      t.references :spec, null: false, foreign_key: true
      t.references :product, null: false, foreign_key: true
      t.references :order, null: false, foreign_key: true
      t.integer :quantity
      t.decimal :amount

      t.timestamps
    end
  end
end
