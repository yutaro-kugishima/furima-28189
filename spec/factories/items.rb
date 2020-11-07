FactoryBot.define do
  factory :item do
    list              {"test"}
    detail                 {"test"}
    price              {1000}
    category_id {2}
    status_id            {2}
    fee_id             {2}
    delivery_place_id       {2}
    delivery_days_id        {2}
    user_id {2}

    after(:build) do |item|
      item.image.attach(io: File.open('public/images/test_image.jpeg'), filename: 'test_image.jpeg')
    end
  end
end
