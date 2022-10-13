class OrderPurchaseRecord

  include ActiveModel::Model
  attr_accessor :price, :prefecture_id, :city, :building, :addresses, :phone_number, :purchase_record_id, :token, :user_id, :item_id, :postal_code
  with_options presence: true do
 
    validates :user_id
    validates :city, presence: true
    validates :addresses, presence: true
    validates :phone_number, presence: true, format: {with: /\A0[0-9]{9,10}\z/}
    validates :prefecture_id, presence: true, numericality: { other_than: 0 }
    validates :postal_code, presence: true, format: {with: /\A[0-9]{3}-[0-9]{4}\z/}
    validates :token, presence: true
  end
  def save
    purchase_record = PurchaseRecord.create(user_id: user_id, item_id: item_id )
    Order.create(prefecture_id: prefecture_id, postal_code: postal_code, city: city, building: building, addresses: addresses, phone_number: phone_number, purchase_record_id: purchase_record.id)
  end
end