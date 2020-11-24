class Product < ApplicationRecord
  products = Product.all
  list = []
  products.each do |p|
    list << p.id
  end
  PRODUCTS = list

  has_many :reviews, dependent: :destroy
  has_many :product_categories
  has_many :categories, through: :product_categories

  # validates :product, inclusion: { in: PRODUCTS }
end
