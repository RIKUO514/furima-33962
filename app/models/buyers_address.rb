class BuyersAddress
  include ActiveModel::Model
  attr_accessor :user_id, :item_id, :postal_code, :prefectures_id, :municipalities, :address, :building, :tel, :token

  with_options presence: true do
    validates :postal_code, format: { with: /\A[0-9]{3}-[0-9]{4}\z/ }
    validates :prefectures_id, numericality: { other_than: 1 }
    validates :municipalities
    validates :address 
    validates :tel, format:{ with: /\A\d{11}\z/ }
    validates :token
    validates :user_id
    validates :item_id
  end
  

  def save
    buyer = Buyer.create(user_id: user_id, item_id: item_id)
    Address.create(postal_code: postal_code, prefectures_id: prefectures_id, municipalities: municipalities, address: address, building: building, tel: tel, buyer_id: buyer.id )
  end

end