class Order < ApplicationRecord
  belongs_to :user
  has_one :item
  has_one :shipping_info
end
