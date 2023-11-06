class Admin::CustomersController < ApplicationController

  def index
    @customers = Customer.all
    @customer = @customers.page(params[:page])
  end

  private

  def item_params
    params.require(:customer).permit(:name, :email)
  end

end
