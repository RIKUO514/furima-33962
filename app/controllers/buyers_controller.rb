class BuyersController < ApplicationController

  before_action :authenticate_user!, only:[:index]
  before_action :set_item, only: [:index, :create]
  before_action :contributor_confirmation, only: [:index, :create]

  def index
 
    @buyers_address = BuyersAddress.new
  end

 

  def create
  
   @buyers_address = BuyersAddress.new(buyers_address_params)
   
   if @buyers_address.valid?
    pay_item
    @buyers_address.save
    redirect_to root_path
   else
    render :index
   end


  end

  private

  def buyers_address_params
    params.require(:buyers_address).permit(:postal_code, :prefectures_id, :municipalities, :address, :building, :tel, :token ).merge(user_id: current_user.id, item_id: params[:item_id], token: params[:token] )
  end

  def pay_item
    Payjp.api_key = ENV["PAYJP_SECRET_KEY"] 
    Payjp::Charge.create(
    amount: @item.price,  
    card: buyers_address_params[:token], 
    currency: 'jpy'               
  )
end

def set_item
  @item = Item.find(params[:item_id])
end

def contributor_confirmation
  redirect_to root_path if current_user == @item.user
  redirect_to root_path if @item.buyer.present?
end

end
