class OrdersController < ApplicationController
  before_action :authenticate_user!
  def index
    @orders = current_user.orders.all
  end
  
  def show
    @order = current_user.orders.find_by(id: params[:id])
    @total_price = @order.sitter.price * days_between(@order.drop_off, @order.pick_up)
  end
  
  def pending
    @orders = current_user.orders.where(status: 'pending')
  end
  
  def finish
    @orders = current_user.orders.where(status: 'paid')
  end
  
  def cancel
    @orders = current_user.orders.where(status: 'cancel')
  end

  private
  def days_between(drop_off, pick_up)
    # d1 = Date.parse(drop_off)
    # d2 = Date.parse(pick_up)
    # (d2 - d1).to_i
    (pick_up - drop_off).to_i
  end
end
