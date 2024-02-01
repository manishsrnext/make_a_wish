class User < ApplicationRecord
  has_many :sent_wishes, foreign_key: :sender_id, class_name: 'Wish'
  has_many :received_wishes, foreign_key: :receiver_id, class_name: 'Wish'

  enum user_type: { user: 0, admin: 1 }

  validates :user_type, presence: true
  validates :user_name, presence: true, length: { minimum: 2, maximum: 15 }, uniqueness: true
  validates :password, presence: true, length: { minimum: 10 }
  validates :email, presence: true, format: { with: /\A([^@\s]+)@((?:[-a-z0-9]+\.)+[a-z]{2,})\z/i }
end