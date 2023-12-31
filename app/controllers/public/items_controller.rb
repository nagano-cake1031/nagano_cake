class Public::ItemsController < ApplicationController

  def index
    @items = Item.all
    @item = @items.page(params[:page])
  end

  def show
    @item = Item.find(params[:id])
    @cart_item = CartItem.new
  end

  def create
    @item = Item.new(item_params)
    @item.user_id = current_user.id
    @item.save
    redirect_to cart_items_path
  end

  private

  def item_params
    params.require(:item).permit(:name, :image, :price, :introduction)
  end

end