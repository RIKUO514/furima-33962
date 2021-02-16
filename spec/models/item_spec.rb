require 'rails_helper'

RSpec.describe Item, type: :model do

  before do
    @item = FactoryBot.build(:item)
  end

  describe '商品出品機能' do

      context '商品出品ができる時' do
        it 'FactoryBotが機能しているのか' do
          expect(@item).to be_valid
        end
      end

     context '商品出品ができない時' do

  it '商品画像を1枚つけることが必須であること'do
    @item.image = nil
    @item.valid?
    expect(@item.errors.full_messages).to include ("Image can't be blank")
  end

  it'商品名が必須であること' do
    @item.name = ''
    @item.valid?
    expect(@item.errors.full_messages).to include ("Name can't be blank")
  end

  it'商品の説明が必須であること'do
    @item.description = ''
    @item.valid?
    expect(@item.errors.full_messages).to include ("Description can't be blank")
  end

  it'カテゴリーの情報が必須であること' do
    @item.category_id= 1
    @item.valid?
    expect(@item.errors.full_messages).to include ( "Category must be other than 1")
  end  

  it'商品の状態についての情報が必須であること' do
    @item.information_id= 1
    @item.valid?
    expect(@item.errors.full_messages).to include ("Information must be other than 1")
  end

  it'配送料の負担についての情報が必須であること'do
    @item.shipping_fee_id= 1
    @item.valid?
    expect(@item.errors.full_messages).to include ("Shipping fee must be other than 1")
  end

  it'発送元の地域についての情報が必須であること' do
    @item.area_id= 1
    @item.valid?
    expect(@item.errors.full_messages).to include ("Area must be other than 1")
  end
  
  it'発送までの日数についての情報が必須であること' do
    @item.days_id= 1
    @item.valid?
    expect(@item.errors.full_messages).to include ("Days must be other than 1")
  end

  it'販売価格についての情報が必須であること' do
    @item.price=''
    @item.valid?
    expect(@item.errors.full_messages).to include ( "Price can't be blank")
  end

  it'販売価格は299円以下では登録できないこと' do
    @item.price='100'
    @item.valid?
    expect(@item.errors.full_messages).to include ("Price is invalid")
  end

  it'販売価格は10,000,000以上では登録できないこと' do
    @item.price='10000000'
    @item.valid?
    expect(@item.errors.full_messages).to include ("Price is invalid")
  end

  it'販売価格は半角数字のみ保存可能であること' do
    @item.price='３００'
    @item.valid?
    expect(@item.errors.full_messages).to include ("Price is invalid")
  end

  it'販売価格は半角英数混合では登録できないこと' do
     @item.price='1a2'
     @item.valid?
     expect(@item.errors.full_messages).to include ("Price is invalid")
  end

  it'販売価格は半角英語だけでは登録できないこと' do
    @item.price='abc'
    @item.valid?
    expect(@item.errors.full_messages).to include ("Price is invalid")
  end

  end
  end
  end
