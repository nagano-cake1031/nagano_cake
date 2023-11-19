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
 @order = Order.new(order_params)
 @order.customer_id = current_customer.id
 @order.postage = 800
 @order.address = current_customer.address
 @order.post_code = current_customer.postal_code
 @order.name = current_customer.last_name + " " + current_customer.first_name
 # @order.pay_method = current_customer.pay_method
 @sum = 0
end

def dex
end

def show
end

private

def order_params
 params.require(:order).permit(:payment_method, :customer_id, :id, :total_price)
end

end
