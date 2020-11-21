FactoryBot.define do
  factory :item_transaction do
    postal_code {123-4567}
    prefecture {1}
    city {あいうえお}
    house_number {か1-1-1}
    telephone_number {00011112222}
    
  end
end