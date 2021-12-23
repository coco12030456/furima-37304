class ItemsController < ApplicationController
  before_action :login_check, only: :new

  def index
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

  private

  def item_params
    params.require(:item).permit(:title, :info, :price, :category_id, :condition_id, :send_price_id, :area_id, :send_day_id, :image).merge(user_id: current_user.id)
  end

  def login_check
    unless user_signed_in?
      redirect_to new_user_session_path
    end
  end
end
