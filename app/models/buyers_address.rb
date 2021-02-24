class BuyersAddress
  include ActiveModel::Model
  attr_accessor :user_id, :item_id, :postal_code, :prefectures_id, :municipalities, :address, :building, :tel, :buyer, :token

  with_options presence: true do
    validates :postal_code, format: { with: /\A[0-9]{3}-[0-9]{4}\z/ }
    validates :prefectures_id, numericality: { other_than: 1 }
    validates :municipalities
    validates :address 
    validates :tel, format:{ with: /\A0[5789]0[-]?\d{4}[-]?\d{4}\z/ }
    validates :token
  end
  

  def save
    buyer = Buyer.create(user_id: user_id, item_id: item_id)
    Address.create(postal_code: postal_code, prefectures_id: prefectures_id, municipalities: municipalities, address: address, building: building, tel: tel, buyer_id: buyer.id )
  end

end