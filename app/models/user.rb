class User < ApplicationRecord
  has_many :sent_wishes, foreign_key: :sender_id, class_name: 'Wish'
  has_many :received_wishes, foreign_key: :receiver_id, class_name: 'Wish'
end