class Product < ApplicationRecord
  has_many :reviews, dependent: :destroy
  has_many :product_categorys
  has_many :categorys, through: :product_categorys

  belongs_to :category
end
