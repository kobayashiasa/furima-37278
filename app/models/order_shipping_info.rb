class OrderShippingInfo
  include ActiveModel::model
  attr_accessor :zip_code, :prefecture_id, :city, :address, :building, :phone, :item_id, :user_id

  with_options presence: true do
    validates :zip_code, format: {with: /\A[0-9]{3}-[0-9]{4}\z/, message: "is invalid. Include hyphen(-)"}
    validates :phone, format: {with: /\A\d{11}\z/, message: "is invalid. Input only number"}
    validates :city, presence: true
    validates :address, presence: true
    validates :user_id
    validates :item_id
  end
  validates :prefecture_id, numericality: {other_than: 0, message: "can't be blank"}
  validates :city, presence: true
  validates :address, presence: true

  def save
    order = Order.create(item_id: item_id, user_id: user_id)
    ShippingInfo.create(zip_code: zip_code, prefecture_id: prefecture_id, city: city, address: address, building: building, order_id: order_id)
  end
end