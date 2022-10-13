FactoryBot.define do
  
  factory :item do
    transient do
      person { Gimei.name }
    end
    
    item_name             {Faker::Lorem.sentence}
    item_text             {Faker::Lorem.sentence}
    category_id              {'2'}
    status_id                {'2'}
    shipping_status_id            {'2'}
    prefecture_id            {'2'}
    scheduled_delivery_id       {'2'}
    price                      {'9999999'}
    association :user
    after(:build) do |item|
      item.image.attach(io: File.open('public/images/test_image.png'), filename: 'test_image.png')
    end
  end
end
