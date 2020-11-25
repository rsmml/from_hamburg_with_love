class OrderDetail < ApplicationRecord
  belongs_to :product
  belongs_to :order

  def unit_price
    if persisted?
      self[:unit_price]
    else
      product.price
    end
  end

  def total
    unit_price * ammount
  end

  private

  def set_unit_price
    self[:unit_price] = unit_price
  end

  def set_total
    self[:price] = total * ammount
  end
end
