class ItemsController < ApplicationController

before_action :authenticate_user!, only: :new

  def index
    #@item = Item.all
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
    params.require(:item).permit(:title, :price, :info, :category_id, :status_id, :shipping_fee_id, :region_id, :schedule_id, :image).merge(user_id: current_user.id )
  end
end
