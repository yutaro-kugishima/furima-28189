class ItemTransaction
  
  include ActiveModel::Model
  attr_accessor :item_id, :user_id, :postal_code, :prefecture, :city, :house_number, :building_name, :telephone_number, :order_id, :token

  with_options presence: true do
    validates :postal_code, format: {with: /\A[0-9]{3}-[0-9]{4}\z/, message: "is invalid. Include hyphen(-)"}
    validates :prefecture, numericality: { other_than: 0 }
    validates :city, format: { with: /\A[ぁ-んァ-ン一-龥]/,message: "is invalid. Input full-width characters."}
    validates :house_number
    validates :telephone_number, numericality: { only_integer:true, message: '半角数字を使用してください' }
    validates :telephone_number, length: { is: 11,message: "is the wrong length (should be 11 characters)"}
    validates :token
  end

  def save
    order = Order.create!(item_id: item_id, user_id: user_id)
    Address.create!(postal_code: postal_code, prefecture: prefecture, city: city, house_number: house_number, building_name: building_name,telephone_number: telephone_number, order_id: order.id)
  end
end

