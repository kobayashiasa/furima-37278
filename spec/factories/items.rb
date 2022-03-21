FactoryBot.define do
  factory :item do
    item_name             {Faker::Lorem.word}
    item_info             {Faker::Lorem.sentence}
    item_price            {Faker::Number.between(from: 300, to: 1000000)}
    category_id           {2}
    item_condition_id     {2}
    who_pays_shipping_id  {2}
    prefecture_id         {2}
    shipping_date_id      {2}

    after(:build) do |item|
      item.image.attach(io: File.open('public/images/test_image.png'), filename: 'test_image.png')
    end
    association :user
  end
end
