require 'rails_helper'

 RSpec.describe OrderPurchaseRecord, type: :model do
   before do
    user = FactoryBot.create(:user)
    item = FactoryBot.create(:item)
    @order_purchase_record = FactoryBot.build(:order_purchase_record, user_id: user.id, item_id: item.id)

   end

   describe '商品購入機能' do
    context '商品購入できるとき' do
     it 'city,addresses,phone_number,prefecture_id,postal_code,user_id,item_id,tokenが入力されていること' do
     expect(@order_purchase_record).to be_valid
     end
     it 'buildingが空でも登録できる' do
     @order_purchase_record.building = nil
     expect(@order_purchase_record).to be_valid
     end

    end
    context '商品購入ができない時' do
     it 'cityが空では登録できない' do
      @order_purchase_record.city = ''
      @order_purchase_record.valid?
      expect(@order_purchase_record.errors.full_messages).to include("Cityを入力してください")
     end

     it 'addressesが空では登録できない' do
      @order_purchase_record.addresses = ''
      @order_purchase_record.valid?
      expect(@order_purchase_record.errors.full_messages).to include("Addressesを入力してください")
     end

     it 'phone_numberが空では登録できない' do
      @order_purchase_record.phone_number = ''
      @order_purchase_record.valid?
      expect(@order_purchase_record.errors.full_messages).to include("Phone numberを入力してください")
     end

     it 'prefecture_idが---では登録できない' do
      @order_purchase_record.prefecture_id = 0 
      @order_purchase_record.valid?
      expect(@order_purchase_record.errors.full_messages).to include("Prefectureは0以外の値にしてください")
     end

     it 'postal_codeが空では登録できない' do
      @order_purchase_record.postal_code = ''
      @order_purchase_record.valid?
      expect(@order_purchase_record.errors.full_messages).to include("Postal codeを入力してください")
     end

     it '郵便番号は、「3桁ハイフン4桁」の半角文字列のみ保存可能なこと' do
      @order_purchase_record.postal_code = '3990033'
      @order_purchase_record.valid?
      expect(@order_purchase_record.errors.full_messages).to include("Postal codeは不正な値です")
     end

     it '電話番号は、11桁以上の半角数値では保存できないこと' do
      @order_purchase_record.phone_number = '12345678999'
      @order_purchase_record.valid?
      expect(@order_purchase_record.errors.full_messages).to include("Phone numberは不正な値です")
     end

     it '電話番号は、9桁以下の半角数値では保存できないこと' do
      @order_purchase_record.phone_number = '123456789'
      @order_purchase_record.valid?
      expect(@order_purchase_record.errors.full_messages).to include("Phone numberは不正な値です")
     end
    end
  end
end
