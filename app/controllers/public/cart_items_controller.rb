class Public::CartItemsController < ApplicationController

  def index
    @item = Item.all
    # @cart_items = Cart_item.all
  end

  def create
    @cart_item = Cart_item.new(cart_item_params)
    @cart_item.user_id = current_user.id
    @cart_item.save
    redirect_to
  end

  def destry
    cart_item = cart_item.find(params[:id])
    cart_item.destroy
    redirect_to cart_items_path
  end

  private

  def cart_item_params
    params.require(:cart_item).permit(:item_id, :amount)
  end

  def item_params
    params.require(:item).permit(:name, :image, :price, :introduction)
  end

end
