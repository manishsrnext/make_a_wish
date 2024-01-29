class Product < ApplicationRecord
  has_many :whish_products
  has_many :wishes, through: :whish_products

  has_one_attached :image
end
