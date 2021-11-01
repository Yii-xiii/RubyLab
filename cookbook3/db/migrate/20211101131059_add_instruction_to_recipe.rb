class AddInstructionToRecipe < ActiveRecord::Migration[6.1]
  def change
    add_column :recipes, :instructions, :string
  end
end
