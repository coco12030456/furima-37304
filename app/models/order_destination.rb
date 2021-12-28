class OrderDestination
  include ActiveModel::Model
  attr_accessor :user_id, :item_id ,:post_code, :area_id, :city, :block, :building, :phone_number, :token

  with_options presence: true do
    validates :post_code, format: {with: /\A[0-9]{3}-[0-9]{4}\z/, message: "is invalid. Include hyphen(-)"}
    validates :city
    validates :block
    validates :phone_number, format: {with: /\A\d{10,11}\z/}
    validates :item_id
    validates :user_id
    validates :token
  end
  validates :area_id, numericality: { other_than: 1 , message: "can't be blank"}
  def save
    order = Order.create(item_id: item_id, user_id: user_id)
    Destination.create(post_code: post_code, area_id: area_id, city: city, block: block, building: building, phone_number: phone_number, order_id: order.id)
  end
end