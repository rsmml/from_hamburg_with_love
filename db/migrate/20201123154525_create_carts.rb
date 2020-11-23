class CreateCarts < ActiveRecord::Migration[6.0]
  def change
    create_table :carts do |t|
      t.references :user, null: false, foreign_key: true
      t.references :product, null: false, foreign_key: true
      t.decimal :price
      t.date :date
      t.integer :order_numer
      t.boolean :status

      t.timestamps
    end
  end
end
