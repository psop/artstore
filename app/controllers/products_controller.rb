class ProductsController < ApplicationController
  def index
  	if params[:category].blank?
      @products = Product.all.order("created_at DESC")
    else
      @category_id = Category.find_by(name: params[:category]).id
      @products = Product.where(category_id: @category_id).order("created_at DESC")
    end
  end

  def show
    @product = Product.find(params[:id])
    @comments = @product.comments
  end

  def add_to_cart
  	@product = Product.find(params[:id])

    if !current_cart.items.include?(@product)
  	  current_cart.add_product_to_cart(@product)
      flash[:notice] = "#{@product.title} has been put in the cart."
    else
      flash[:warning] = "Your cart already has this item."
    end

    redirect_to :back
  end
end
