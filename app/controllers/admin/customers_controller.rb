class Admin::CustomersController < ApplicationController

  def index
    @customers = Customer.all
    @customer = @customers.page(params[:page])
  end

  def show
    @customer = Customer.find(params[:id])
  end

  def edit
    @customer = Customer.find(params[:id])
  end
  
  def update
        
  end

  private

  def item_params
    params.require(:customer).permit(:name, :email)
  end

end
