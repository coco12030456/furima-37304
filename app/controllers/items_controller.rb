class ItemsController < ApplicationController
  before_action :login_check, only: [:new, :edit, :destroy ]
  before_action :item_find, only: [:show, :edit, :update, :destroy]
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
  end

  def edit
    unless current_user.id == @item.user_id
      redirect_to action: :index
    end
  end

  def update
    if item_find.update(item_params)
      redirect_to item_path(item_find)
    else
      render :edit
    end
  end

  def destroy
    if current_user.id == @item.user_id
      @item.destroy
      redirect_to root_path
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

  def item_find
    @item = Item.find(params[:id])
  end
end
