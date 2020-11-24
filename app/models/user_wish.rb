class UserWish < ApplicationRecord
  belongs_to :user
  belongs_to :wish_list
  belongs_to :product
end
