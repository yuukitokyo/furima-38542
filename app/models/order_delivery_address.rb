class OrderDeliveryAddress
  include ActiveModel::Model
  attr_accessor :postal_code, :delivery_area_id, :city, :block, :building_name, :phone_number, :user_id, :item_id, :token


 with_options presence: true do 
  validates :user_id
  validates :item_id
  validates :postal_code, format: { with: /\A[0-9]{3}-[0-9]{4}\z/ }
  validates :delivery_area_id, numericality: { other_than: 1, message: "can't be blank" }
  validates :city
  validates :block
  validates :phone_number, format: { with: /\A\d{10,11}\z/, message: 'is invalid' }
  validates :token
 end



  def save
    order = Order.create(user_id: user_id, item_id: item_id)
    DeliveryAddress.create(postal_code: postal_code, delivery_area_id: delivery_area_id, city: city, block: block, building_name: building_name, phone_number: phone_number, order_id: order.id)

  end

end