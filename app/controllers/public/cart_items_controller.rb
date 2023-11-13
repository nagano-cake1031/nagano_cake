class Public::CartItemsController < ApplicationController

  def index
    @cart_items = current_customer.cart_items
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

  def update
    @cart_item = CartItem.find(params[:id])
    @cart_item.customer_id = current_customer.id
    #byebug
    @cart_item.update(cart_item_params)
    redirect_to cart_items_path
  end

  def destroy
    @cart_item = CartItem.find(params[:id])
    @cart_item.destroy
    redirect_to cart_items_path
  end

  private

  def cart_item_params
    params.require(:cart_item).permit(:item_id, :amount, :customer_id)
  end

  def cart_item_state
    @cart_item = Item.find_by(item: params[:name])
    return if item.nil?
    return unless item.valid_name?(params[:name])
  end


end
