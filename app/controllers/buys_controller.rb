class BuysController < ApplicationController
  before_action :authenticate_user!
  before_action :find_item, only: [:index, :create]
  before_action :defend, only: [:index, :create]
  def index
    @buy_customer = BuyCustomer.new
  end

  def create
    @buy_customer = BuyCustomer.new(buy_params)
    if @buy_customer.valid?
      pay_item
      @buy_customer.save
      redirect_to root_path
    else
      render :index
    end

  end

  private

  def defend
    redirect_to root_path if current_user.id == @item.user.id || @item.buy.present?
  end

  def find_item
    @item = Item.find(params[:item_id])
  end

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
