class Admin::OrdersController < ApplicationController

 def show
   @order = Order.find(params[:id])
   @customer = @order.customer
   @sum = 0
 end

 private

def order_params
 params.require(:order).permit(:payment_method, :customer_id, :total_price, :postage, :address, :post_code, :name)
end

end
