class ItemsController < ApplicationController
  before_action :authenticate_user!, only: [:new, :create]
  def index
    @items = Item.all.order("created_at DESC")
    
  end

  def edit

  end

  def new
    @item = Item.new

  end

  def create
    @item = Item.new(item_params)
    if @item.save
      redirect_to root_path
    else
      render :new
    end

  end

  def show
    @item = Item.find(params[:id])

  end







  def item_params
    params.require(:item).permit(:title, :image, :value, :description, :delivery_id, :place_id, :how_long_id, :category_id, :status_id).merge(user_id: current_user.id)
  end

end
