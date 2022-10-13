FactoryBot.define do
  
  factory :order_purchase_record do
    transient do
      person { Gimei.name }
    end
    
    building{ '' }
    token{ 'abcdefghi' }
    city             { '大阪府大阪市' }
    addresses                {'東成区大今里南6-14-13'}
    phone_number              {'08049851823'}
    prefecture_id             { 27 }
    postal_code             {'537-0013'}

  end
end








