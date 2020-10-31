class Item < ApplicationRecord
  has_one_attached :image

  with_options presence:true do
    validates :list
    validates :detail
    validates :price
    validates :category_id
    validates :status_id
    validates :fee_id
    validates :delivery_place_id
    validates :delivery_days_id
    validates :user_id
  end
end