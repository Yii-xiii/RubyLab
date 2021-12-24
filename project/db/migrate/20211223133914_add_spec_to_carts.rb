class AddSpecToCarts < ActiveRecord::Migration[6.1]
  def change
    add_reference :carts, :spec, null: false, foreign_key: true
  end
end
