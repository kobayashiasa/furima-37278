class Item < ApplicationRecord
  belongs_to :user
  
  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to :category
  belongs_to :item_condition
  belongs_to :who_pays_shipping
  belongs_to :prefecture
  belongs_to :shipping_date
end
