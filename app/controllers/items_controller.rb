class ItemsController < ApplicationController
  before_action :login_check, only: [:new, :edit]

  def index
    @items = Item.order("created_at DESC")
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

  def edit
    @item = Item.find(params[:id])
    unless user_signed_in? && current_user.id == @item.user_id
      redirect_to action: :index
    end
  end

  def update
    @item = Item.find(params[:id])
    if @item.update(item_params)
      redirect_to item_path(@item)
    else
      render :edit
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
