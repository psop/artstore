class CartsController < ApplicationController
  before_action :authenticate_user!, only: [:checkout]
  
  def checkout
  	@order = current_user.orders.build
  	@infor = @order.build_info
  end

  def clean
  	current_cart.clean!
  	flash[:warning] = "The Cart has been reset."
  	redirect_to carts_path
  end
end
