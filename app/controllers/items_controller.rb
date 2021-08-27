class ItemsController < ApplicationController
  before_action :authenticate_user!, only: [:new, :create, :edit, :update,:destroy]
  before_action :move_to_index, only: [:edit, :update,:destroy]
  before_action :get_item_record, only: [:show,:edit,:update,:destroy]

  def index
    @items = Item.includes(:user).order(id: 'DESC')
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

  def edit
    
  end

  def update
    @item.update(item_params)
    if @item.save
      redirect_to item_path(@item.id)
    else
      render :edit
    end
  end

  def destroy
    @item.destroy
    redirect_to root_path
  end
  private

  def item_params
    params.require(:item).permit(:image, :name, :explanation, :category_id, :status_id, :shipping_charge_id, :prefecture_id,
                                 :days_to_ship_id, :price).merge(user_id: current_user.id)
  end

  def get_item_record
    @item = Item.find(params[:id])
  end
  
  def move_to_index
      get_item_record
     if @item.user != current_user
      redirect_to action: :index
     end
  end
end
