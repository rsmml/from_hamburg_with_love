class DeleteColumnFromTable < ActiveRecord::Migration[6.0]
  def change
    remove_column :order_details, :ammount
  end
end
