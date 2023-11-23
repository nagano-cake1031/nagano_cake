class Admin::HomesController < ApplicationController

  def top
    # @order.name = current_customer.last_name + " " + current_customer.first_name
    @order = Order.page(params[:page])
    @sum = 0
  end

  private

  def order_detail_params
    params.require(:order_detail).permit(:payment_method, :customer_id, :total_price, :postage, :address, :post_code, :name)
  end

end
