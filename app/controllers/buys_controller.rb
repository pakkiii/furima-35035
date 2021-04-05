class BuysController < ApplicationController
  before_action :authenticate_user!
  def index
    @buy_customer = BuyCustomer.new
    @item = Item.find(params[:item_id])
    if current_user.id == @item.user.id
      redirect_to root_path
    end
    if @item.buy.present?
      redirect_to root_path
    end
  end

  def create
    @buy_customer = BuyCustomer.new(buy_params)
    @item = Item.find(params[:item_id])
    if @buy_customer.valid?
      pay_item
      @buy_customer.save
      redirect_to root_path
    else
      render :index
    end

  end

  private

  def buy_params
    params.require(:buy_customer).permit(:postal_code, :place_id, :municipalities, :address, :tel_number, :build_name).merge(token: params[:token], user_id: current_user.id, item_id: params[:item_id])
  end

  def pay_item
    Payjp.api_key = ENV["PAYJP_SECRET_KEY"]
      Payjp::Charge.create(
        amount: @item.value,  
        card: buy_params[:token],    
        currency: 'jpy'                 
      )
  end

  


  
  
end
