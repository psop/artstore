class OrderMailer < ApplicationMailer
  def notify_order_placed(order)
    @order       = order
    @user        = order.user
    @order_items = @order.items
    @order_info  = @order.info

    mail(to: @user.email , subject: "[TravelFun] Thank you for shopping, this is your order info #{order.token}")
  end
end
