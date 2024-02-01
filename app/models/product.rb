class Product < ApplicationRecord
  has_many :whish_products
  has_many :wishes, through: :whish_products

  has_one_attached :image

  validates :product_name, presence: true
  validates :price, presence: true
  validates :description, presence: true
end
