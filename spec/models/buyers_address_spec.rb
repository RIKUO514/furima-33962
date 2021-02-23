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
    end






end