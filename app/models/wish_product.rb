class WishProduct < ApplicationRecord
  belongs_to :wish
  belongs_to :product
end
