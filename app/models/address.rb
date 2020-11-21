class Address < ApplicationRecord
  has_one :order
  belong_to :user
end