FactoryBot.define do
  factory :item_transaction do
    postal_code {'123-4567'}
    prefecture { 1 }
    city {'東京都'}
    house_number { '1-1' }
    building_name {'東京ハイツ'}
    telephone_number {'00011112222'}
    token {"tok_abcdefghijk00000000000000000"}
  end
end