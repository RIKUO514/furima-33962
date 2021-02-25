require 'rails_helper'

RSpec.describe BuyersAddress, type: :model do

  before do

    @buyers_address = FactoryBot.build(:buyers_address)

    
  end

  describe '商品購入内容確認' do

    context '商品購入内容が確認できる時' do
      it 'FactoryBotが機能しているのか' do
        expect(@buyers_address).to be_valid
      end

      it '建物名が抜けていても登録ができる' do
        expect(@buyers_address).to be_valid
      end

    end

    context '商品購入内容が確認できない時' do


      it 'item_idがないと登録できないこと' do
        @buyers_address.item_id = nil
        @buyers_address.valid?
        expect(@buyers_address.errors.full_messages).to include ("Item can't be blank")
      end


      it 'user_idがないと登録できないこと' do
        @buyers_address.user_id = nil
        @buyers_address.valid?
        expect(@buyers_address.errors.full_messages).to include ("User can't be blank")
      end




      it '郵便番号が必須であること' do
        @buyers_address.postal_code = nil
        @buyers_address.valid?
        expect(@buyers_address.errors.full_messages).to include ("Postal code can't be blank")
      end

      it '郵便番号に「-」が必須であること' do
        @buyers_address.postal_code = '1234567'
        @buyers_address.valid?
        expect(@buyers_address.errors.full_messages).to include ("Postal code is invalid")
      end

      it '郵便番号が半角数字のみ保存可能であること' do
        @buyers_address.postal_code = '１２３４５６７'
        @buyers_address.valid?
        expect(@buyers_address.errors.full_messages).to include ("Postal code is invalid")
      end
      
      it '都道府県が必須であること' do
        @buyers_address.prefectures_id=  nil
        @buyers_address.valid?
        expect(@buyers_address.errors.full_messages).to include ("Prefectures is not a number")
      end

      it '都道府県のIDが「1」意外登録できないこと' do
        @buyers_address.prefectures_id= "1"
        @buyers_address.valid?
    
        expect(@buyers_address.errors.full_messages).to include ("Prefectures must be other than 1")
      end


      it '市区町村が必須であること' do
        @buyers_address.municipalities=  nil
        @buyers_address.valid?
        expect(@buyers_address.errors.full_messages).to include ("Municipalities can't be blank")
      end

      it '番地が必須であること' do
        @buyers_address.address =  nil
        @buyers_address.valid?
        expect(@buyers_address.errors.full_messages).to include ("Address can't be blank")
      end

      it '電話番号が必須であること' do
        @buyers_address.tel =  nil
        @buyers_address.valid?
        expect(@buyers_address.errors.full_messages).to include ("Tel can't be blank")
      end

      it '電話番号は11桁以内の数字のみ保存可能なこと' do
        @buyers_address.tel = '090123456789'
        @buyers_address.valid?
        expect(@buyers_address.errors.full_messages).to include ("Tel is invalid")
      end

      it '電話番号は半角数字のみ保存可能であること' do
        @buyers_address.tel = '０９０１２３４５６７８'
        @buyers_address.valid?
        expect(@buyers_address.errors.full_messages).to include ("Tel is invalid")
      end

      it 'tokenが空では登録できないこと' do
        @buyers_address.token = nil
        @buyers_address.valid?
        expect(@buyers_address.errors.full_messages).to include ("Token can't be blank")
      end
  end
 end
end