class CreateOrders < ActiveRecord::Migration[6.0]
  def change
    create_table :orders do |t|
      t.references :user, null: false, foreign_key: true
      t.date :date
      t.decimal :total_ammount
      t.string :shipping_address
      t.boolean :status

      t.timestamps
    end
  end
end
