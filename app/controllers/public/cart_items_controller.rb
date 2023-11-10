class Public::CartItemsController < ApplicationController

  def index
    @cart_items = CartItem.all
    @sum = 0
  end

  def show
    @cart_item_new = CartItem.new
    @item = Item.find(params[:id])
    @cart_item = CartItem.find(params[:id])
    @cart_item.item = @customer_id
  end

  def create
    @cart_item = CartItem.new(cart_item_params)
    @cart_item.customer_id = current_customer.id
    @cart_item.save
    redirect_to cart_items_path
  end

  def destry
    @cart_item = cart_item.find(params[:id])
    @cart_item.item.destroy
    redirect_to cart_items_path
  end

  private

  def cart_item_params
    params.require(:cart_item).permit(:item_id, :amount, :customer_id)
  end


end
