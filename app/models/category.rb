class Category < ApplicationRecord
  categories = Category.all
  list = []
  categories.each do |p|
    list << p.id
  end
  CATEGORIES = list

  has_many :product_categories, dependent: :destroy
  has_many :products, through: :product_categories

  # validates :categories, inclusion: { in: CATEGORIES }
end
