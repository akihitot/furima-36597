class ItemsController < ApplicationController
  def index
  end

  
  
  
  
  
  private

  def item_params
    params.require(:item).permit(:image,:name,:explanation,:category_id,:status_id,:shipping_charge_id,:prefecture_id,:days_to_ship_id,:price).merge(user_id: current_user.id)
  end
end
