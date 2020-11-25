class Order < ApplicationRecord
  before_save :set_subtotal

  belongs_to :user

  has_many :order_details, dependent: :destroy
  has_many :products, through: :order_details

  def add_product(product)
    current_product = order_details.find_by(product_id: product.id)
    if current_product
      current_product.increment(:ammount)
    else
      current_product = order_details.build(product_id: product.id)
    end
    current_product
  end

  def subtotal
    order_details.collect{|order_detail| order_detail.valid? ? order_detail.price*order_detail.ammount : 0}.sum
  end

  private

  def set_subtotal
    self[:subtotal] = subtotal
  end
end
