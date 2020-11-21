class ItemTransaction
  
  include ActiveModel::Model
  attr_accessor :item_id, :user_id, :postal_code, :prefecture, :city, :house_number, :building_name, :telephone_number, :order_id

  with_options presence: true do
    validates :postal_code, format: {with: /\A[0-9]{3}-[0-9]{4}\z/, message: "is invalid. Include hyphen(-)"}
    validates :prefecture, numericality: { other_than: 0 }
    validates :city, format: { with: /\A[ぁ-んァ-ン一-龥]/,message: "is invalid. Input full-width characters."}
    # validates :addresses
    validates :telephone_number, numericality: { only_integer:true, message: '半角数字を使用してください' }
    # validates :building
  end

  def save
    # item = Item.create(list: list, detail: detail, price: price, category_id: category_id, status_id: status_id, fee_id: fee_id, delivery_id: delivery_id, delivery_days: delivery_days)
    # user = User.create(nickname: nickname)
    Address.create(postal_code: postal_code, prefecture: prefecture, city: city, house_number: house_number, building_name: building_name,telephone_number: telephone_number)
    Order.create(item_id: item_id, user_id: user_id)
  end
end

