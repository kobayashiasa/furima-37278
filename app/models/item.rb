class Item < ApplicationRecord
  belongs_to :user
  has_one_attached :image

  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to :category
  belongs_to :item_condition
  belongs_to :who_pays_shipping
  belongs_to :prefecture
  belongs_to :shipping_date

  validates :item_name, :item_price, :item_info, :image, presence: true
  validates :category_id, :item_condition_id, :who_pays_shipping_id, :prefecture_id, :shipping_date_id,
            numericality: { other_than: 1, message: "can't be blank" }
  validates :item_price, numericality: { greater_than_or_equal_to: 300, less_than: 9_999_999, message: 'is out of setting range' }
end
