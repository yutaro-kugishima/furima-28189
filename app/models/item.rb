class Item < ApplicationRecord
  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to_active_hash :category
  belongs_to_active_hash :status
  belongs_to_active_hash :fee
  belongs_to_active_hash :delivery_place
  belongs_to_active_hash :delivery_days
  has_one_attached :image
  belongs_to :user

  with_options presence:true do
    validates :image
    validates :list
    validates :detail
    validates :price, presence: {message: "300以上9999999以下で入力してください"}
    validates :price, numericality: { greater_than_or_equal_to:300, less_than_or_equal_to: 9_999_999, message: '300以上9999999以下で入力してください' }
    validates :price, numericality: { only_integer:true, message: '半角数字を使用してください' }
    validates :category_id, numericality: { other_than: 1 }
    validates :status_id, numericality: { other_than: 1 }
    validates :fee_id, numericality: { other_than: 1 }
    validates :delivery_place_id, numericality: { other_than: 1 }
    validates :delivery_days_id, numericality: { other_than: 1 }
    validates :user_id
  end
end