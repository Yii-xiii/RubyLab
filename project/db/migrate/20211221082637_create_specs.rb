class CreateSpecs < ActiveRecord::Migration[6.1]
  def change
    create_table :specs do |t|
      t.string :title
      t.references :product

      t.timestamps
    end
  end
end
