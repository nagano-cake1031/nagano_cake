class Admin::OrdersController < ApplicationController

 def show
   @order = Order.find(params[:id])
   @cart_items = current_customer.cart_items
 end

 private

def order_params
 params.require(:order).permit(:payment_method, :customer_id, :total_price, :postage, :address, :post_code, :name)
end

end
