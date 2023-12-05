class Public::OrdersController < ApplicationController

def new
 @order = Order.new
 @customer = current_customer
end

def create
 @order = Order.new(order_params)
 @order.customer_id = current_customer.id
 if @order.save
 @cart_item = current_customer.cart_items
 @cart_item.each do |cart_item|
 @order_detail = OrderDetail.new
 @order_detail.item_id = cart_item.item_id
 @order_detail.order_id = @order.id
 @order_detail.amount = cart_item.amount
 @order_detail.price = (cart_item.item.price*1.08).floor
 @order_detail.save
 end
 @cart_item.destroy_all
 redirect_to orders_complete_path
 end
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

def complete
end

def index
 @orders = Order.all
 @order_details = OrderDetail.all
end

def show
 @order = Order.find(params[:id])
 @sum = 0
 @order_details = OrderDetail.where(order_id: params[:id])
end

private

def order_params
 params.require(:order).permit(:payment_method, :customer_id, :total_price, :postage, :address, :post_code, :name,)
end

end
