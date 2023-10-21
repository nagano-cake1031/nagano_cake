class UsersController < ApplicationController
  def show
    @user = current_customer
  end

  def edit
  end
end
