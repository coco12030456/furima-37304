class ItemsController < ApplicationController
  def index
  end


  private

  def prototype_params
    params.require(:item).permit(:title, :info, :price, :category_id, :condition_id, :send_price_id, :area_id, :send_day_id, :image).merge(user_id: current_user.id)
  end
end
