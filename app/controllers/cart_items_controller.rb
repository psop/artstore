class CartItemsController < ApplicationController
  before_action :authenticate_user!

  def destroy
    @cart = current_cart
    @item = @cart.find_cart_item(params[:id])
    @product = @item.product
    @item.destroy

    flash[:warning] = "#{@product.title} has been deleted sucessfully."
    redirect_to :back
  end

  def update
  	@cart = current_cart
  	@item = @cart.cart_items.find_by(product_id: params[:id])

  	if @item.product.quantity >= item_params[:quantity].to_i
      @item.update(item_params)
      flash[:notice] = "Change quantity successfully."
    else
      flash[:warning] = "Sold Out."
    end

  	redirect_to carts_path
  end

  private

  def item_params
  	params.require(:cart_item).permit(:quantity)
  end
end
