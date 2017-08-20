class CommentsController < ApplicationController
  before_action :authenticate_user!
  before_action :find_product

  def new
  	@comment = @product.comments.new
  end

  def create
    @comment = @product.comments.build(comment_params)
    @comment.user_id = current_user.id
    @comment.product_id = @product.id

    if @comment.save
      redirect_to product_path(@product), notice: "Thank you for your comment."
    else
      render :new
    end
  end

  def edit
  	@comment = @product.comments.find(params[:id])
  end

  def update
  	@comment = @product.comments.find(params[:id])
  	if @comment.save
  	  redirect_to product_path(@product), notice: "Your comment has been updated."
  	else
  	  render :edit
  	end
  end

  def destroy
  	@comment = @product.comments.find(params[:id])
  	@comment.destroy
  	redirect_to product_path(@product), alert: "The comment has been deleted."
  end

  private

  def find_product
  	@product = Product.find(params[:product_id])
  end

  def comment_params
  	params.require(:comment).permit(:context)
  end
end
