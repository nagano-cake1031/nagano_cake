class Public::OrdersController < ApplicationController

def new
 @order = Order.new
 @customer = current_customer
end

def create
 @order = Order.new(order_params)
 @order.customer_id = current_customer.id
 @order.save
 redirect_to orders_check_path
end

def check
 @cart_items = current_customer.cart_items
 @order = Order.new
 @sum = 0
 @postage = 800
 @amount = 0
end

def index
end

def show
end

private

def order_params
 params.require(:order).permit(:postal_code, :address, :name, :item_id, :amount, :customer_id)
end

end
