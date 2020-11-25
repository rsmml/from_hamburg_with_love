class AddColumnToTable < ActiveRecord::Migration[6.0]
  def change
    add_column :order_details, :ammount, :integer, default: 1
  end
end
