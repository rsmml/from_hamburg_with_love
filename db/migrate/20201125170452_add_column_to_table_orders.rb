class AddColumnToTableOrders < ActiveRecord::Migration[6.0]
  def change
    add_column :orders, :subtotal, :decimal
  end
end
