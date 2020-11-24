class CreateUserWishes < ActiveRecord::Migration[6.0]
  def change
    create_table :user_wishes do |t|
      t.references :user, null: false, foreign_key: true
      t.references :wish_list, null: false, foreign_key: true
      t.references :product, null: false, foreign_key: true
      t.integer :amount

      t.timestamps
    end
  end
end
