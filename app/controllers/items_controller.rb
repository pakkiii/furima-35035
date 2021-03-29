class ItemsController < ApplicationController
  before_action :authenticate_user!, except: [:show, :index]
  before_action :move_to_index, only: [:edit]
  before_action :easy, only: [:show, :edit, :update]
  def index
    @items = Item.all.order('created_at DESC')
  end

  def edit
  end

  def update
    if @item.update(item_params)
      redirect_to item_path(@item.id)
    else
      render :edit
    end
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
  end

  def move_to_index
    @item = Item.find(params[:id])
    redirect_to action: :index unless current_user.id == @item.user.id
  end

  def easy
    @item = Item.find(params[:id])
  end

  def item_params
    params.require(:item).permit(:title, :image, :value, :description, :delivery_id, :place_id, :how_long_id, :category_id,
                                 :status_id).merge(user_id: current_user.id)
  end
end
