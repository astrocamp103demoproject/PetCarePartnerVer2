class OrdersController < ApplicationController
  def index
    @orders = current_user.orders.all
    # @sitter = Sitter.find_by(id: params[:id])
  end
  def show
    @order = Order.find_by(id: params[:id])
  end
end
