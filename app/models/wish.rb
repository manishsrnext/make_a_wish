class Wish < ApplicationRecord
  belongs_to :sender, class_name: 'User', foreign_key: :sender_id

  belongs_to :followings, class_name: "User", optional: true, foreign_key: :receiver_id
  has_many :wish_products
  has_many :products, through: :wish_products

  enum status: { pending: 0, completed: 1 }

end
