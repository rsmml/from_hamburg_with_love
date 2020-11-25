class AddUnitPriceToOrderDetails < ActiveRecord::Migration[6.0]
  def change
    add_column :order_details, :unit_price, :decimal
  end
end
