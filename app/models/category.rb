class Category < ApplicationRecord
  has_many :product_categorys
  has_many :products, through: :product_categorys
end
