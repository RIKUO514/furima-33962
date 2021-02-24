class BuyersController < ApplicationController

  def index
    @item = Item.find(params[:item_id])
    @buyers_address = BuyersAddress.new
  end

 

  def create
   @item = Item.find(params[:item_id])
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
end
