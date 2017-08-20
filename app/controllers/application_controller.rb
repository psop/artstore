class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  before_action :configure_permitted_parameters, if: :devise_controller?

  protected

  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:sign_up) do |u|
      u.permit(:name, :email, :password, :password_confirmation)
    end
    devise_parameter_sanitizer.permit(:account_update) do |u|
      u.permit(:name, :email, :password, :password_confirmation, :current_password)
    end
  end

  protect_from_forgery with: :exception

  def admin_required
  	if !current_user.admin?
  	  redirect_to "/"
  	end
  end

  helper_method :current_cart

  def current_cart
  	@current_cart ||= find_cart
  end

  private

  def find_cart
  	cart = Cart.find_by(id: session[:cart_id])
  
    unless cart.present?
      cart = Cart.create
    end

    session[:cart_id] = cart.id
    cart
  end
end
