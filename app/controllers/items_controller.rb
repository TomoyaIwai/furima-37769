class ItemsController < ApplicationController

before_action :authenticate_user!, only: [:new, :edit]
before_action :set_item, only: [:destroy, :show, :edit, :update]

  def index
    @items = Item.all.order(created_at: "DESC")
  end

  def new
    @item = Item.new
  end

  def show
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
    if @item.user.id == current_user.id
      @item.destroy
    end
    redirect_to root_path
  end

  def edit
    if @item.user.id != current_user.id || @item.order
      redirect_to root_path
    end
  end

  def update
    if @item.update(item_params)
      redirect_to item_path
    else
      render :edit
    end  
  end

  private

  def item_params
    params.require(:item).permit(:title, :price, :info, :category_id, :status_id, :shipping_fee_id, :region_id, :schedule_id, :image).merge(user_id: current_user.id )
  end

  def set_item
    @item = Item.find(params[:id])
  end
end
