class ItemsController < ApplicationController

before_action :authenticate_user!, only: :new

  def index
    @items = Item.all.order(created_at: "DESC")
  end

  def new
    @item = Item.new
  end

  def show
    @item = Item.find(params[:id])
  end

  def create
    @item = Item.new(item_params)
    if @item.save
      redirect_to root_path
    else
      render :new
    end
  end

  def destroy
    @item = Item.find(params[:id])
    if @item.user.id == @item.current_user.id
      @item.destroy
    end
    redirect_to root_path
  end

  private

  def item_params
    params.require(:item).permit(:title, :price, :info, :category_id, :status_id, :shipping_fee_id, :region_id, :schedule_id, :image).merge(user_id: current_user.id )
  end
end
