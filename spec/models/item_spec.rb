require 'rails_helper'

 RSpec.describe Item, type: :model do
   before do
    @item = FactoryBot.build(:item)
   end

   describe 'ユーザー新規登録' do
     context '出品できるとき' do
     it '必要な情報を適切に入力して「出品する」ボタンを押すと、商品情報がデータベースに保存されること' do
     expect(@item).to be_valid
     end
    end
     context '出品できないとき' do
     it '商品名が必須であること' do
       @item.item_name = ''
       @item.valid?
      expect(@item.errors.full_messages).to include("商品名を入力してください")
     end
     it '商品の説明が必須であること' do
       @item.item_text = ''
       @item.valid?
      expect(@item.errors.full_messages).to include("商品情報を入力してください")
     end
     it 'カテゴリーの情報が必須であること' do
      @item.category_id = ''
      @item.valid?
      expect(@item.errors.full_messages).to include("カテゴリーを入力してください")
     end
     it '商品の状態の情報が必須であること' do
       @item.status_id = ''
       @item.valid?
      expect(@item.errors.full_messages).to include("状態を入力してください")
     end
     it '発送元の地域の情報が必須であること' do
       @item.prefecture_id = ''
       @item.valid?
      expect(@item.errors.full_messages).to include("発送元都道府県を入力してください")
     end
     it '発送までの日数の情報が必須であること' do
       @item.scheduled_delivery_id = ''
       @item.valid?
      expect(@item.errors.full_messages).to include("発送目安を入力してください")
     end
     it '配送料の負担の情報が必須であること' do
      @item.shipping_status_id = ''
      @item.valid?
     expect(@item.errors.full_messages).to include("発送方法を入力してください")
     end
     it '価格の情報が必須であること' do
       @item.price = ''
       @item.valid?
      expect(@item.errors.full_messages).to include("値段を入力してください")
     end
     it '販売価格が¥300より少ない時は出品できないこと' do
       @item.price = 299
       @item.valid?
      expect(@item.errors.full_messages).to include("値段は300以上の値にしてください")
     end
     it '販売価格が¥9999999より多い時は出品できないこと' do
       @item.price = 10000000
       @item.valid?
      expect(@item.errors.full_messages).to include("値段は9999999以下の値にしてください")
     end
     it 'priceが全角数字だと保存できないこと' do
       @item.price = '２０００'
       @item.valid?
      expect(@item.errors.full_messages).to include('値段は数値で入力してください')
     end
     it '画像の添付が必須であること' do
      @item.image = nil
      @item.valid?
     expect(@item.errors.full_messages).to include("画像を入力してください")
     end
     it 'userが紐付いていないと保存できない' do
      @item.user = nil
      @item.valid?
      expect(@item.errors.full_messages).to include('Userを入力してください')
     end
     it 'カテゴリーに「---」が選択されている場合は出品できない' do
      @item.category_id = 1
      @item.valid?
      expect(@item.errors.full_messages).to include("カテゴリーは1以外の値にしてください")
     end
     it '商品の状態に「---」が選択されている場合は出品できない' do
       @item.status_id = 1
       @item.valid?
      expect(@item.errors.full_messages).to include("状態は1以外の値にしてください")
     end
     it '発送元の地域に「---」が選択されている場合は出品できない' do
       @item.prefecture_id = 0
       @item.valid?
      expect(@item.errors.full_messages).to include("発送元都道府県は0以外の値にしてください")
     end
     it '発送までの日数に「---」が選択されている場合は出品できない' do
       @item.scheduled_delivery_id = 1
       @item.valid?
      expect(@item.errors.full_messages).to include("発送目安は1以外の値にしてください")
     end
     it '配送料の負担「---」が選択されている場合は出品できない' do
      @item.shipping_status_id = 1
      @item.valid?
     expect(@item.errors.full_messages).to include("発送方法は1以外の値にしてください")
     end
    end
  end
end