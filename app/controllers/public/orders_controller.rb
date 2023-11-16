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

def index
end

def show
end

private

def order_params
 params.require(:order).permit(:postal_code, :address, :name)
end

end
