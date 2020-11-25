class Product < ApplicationRecord
  before_destroy :not_referenced_by_any_order_detail
  # products = Product.all
  # list = []
  # products.each do |p|
  #   list << p.id
  # end
  # PRODUCTS = list

  has_many :reviews, dependent: :destroy
  has_many :product_categories, dependent: :destroy
  has_many :categories, through: :product_categories

  has_many :order_details

  private

  def not_referenced_by_any_order_detail
    unless order_details.empty?
      errors.add(:base, 'Order details present')
      throw :abort
    end
  end
end
