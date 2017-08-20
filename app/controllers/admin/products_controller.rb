class Admin::ProductsController < ApplicationController
  layout "admin"

  before_action :authenticate_user!
  before_action :admin_required

  def index
    if params[:category].blank?
      @products = Product.all.order("created_at DESC")
    else
      @category_id = Category.find_by(name: params[:category]).id
      @products = Product.where(category_id: @category_id).order("created_at DESC")
    end
  end
  
  def new
  	@product = Product.new
    @photo = @product.build_photo
  end

  def create
  	@product = Product.new(product_params)

  	if @product.save
  	  redirect_to admin_products_path
  	else
  	  render 'new'
  	end
  end

  def edit
    @product = Product.find(params[:id])

    if @product.photo.present?
      @photo = @product.photo
    else
      @photo = @product.build_photo
    end
  end

  def update
    @product = Product.find(params[:id])

    if @product.update(product_params)
      redirect_to admin_products_path
    else
      render 'edit'
    end
  end

  private

  def product_params
  	params.require(:product).permit(:title, :description, :quantity, :price, :category_id, photo_attributes: [:image, :id])
  end
end
