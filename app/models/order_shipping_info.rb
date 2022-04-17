class OrderShippingInfo
  include ActiveModel::Model
  attr_accessor :zip_code, :prefecture_id, :city, :address, :building, :phone, :item_id, :user_id, :token
  validates :token, presence: true
  with_options presence: true do
    validates :zip_code, format: {with: /\A[0-9]{3}-[0-9]{4}\z/, message: "is invalid. Include hyphen(-)"}
    validates :phone, numericality: {only_integer: true}, length: { in: 10..11 }
    validates :city
    validates :address
    validates :user_id
    validates :item_id
  end
  validates :prefecture_id, numericality: {other_than: 0, message: "can't be blank"}

  def save
    order = Order.create(item_id: item_id, user_id: user_id)
    ShippingInfo.create(zip_code: zip_code, prefecture_id: prefecture_id, city: city, address: address, building: building, phone: phone, order_id: order.id)
  end
end