class CreateFollowships < ActiveRecord::Migration[6.1]
  def change
    create_table :followships do |t|
      t.references :user, null: false, foreign_key: {to_table: "users"}
      t.references :following_user, null: false, foreign_key: {to_table: "users"}

      t.timestamps
    end
  end
end
