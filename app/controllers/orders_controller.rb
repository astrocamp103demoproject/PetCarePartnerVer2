class OrdersController < ApplicationController
  include Payable
  before_action :authenticate_user!

  def index
    @orders = current_user.orders.all.page(params[:page]).per(5) 
  end

  def new
    @order = Order.new
    @booking_date = BookingDate.new
    @sitter = session[:current_sitter].to_h
    @drop = Date.strptime(session[:drop_off], '%m/%d/%Y')
    @pick = Date.strptime(session[:pick_up], '%m/%d/%Y')
    @total = (@pick - @drop).to_i * @sitter['price']
    
    @token = gateway.client_token.generate
    
  end
  
  def create
    @order = Order.new(order_params)
    @sitter = session[:current_sitter].to_h
    @drop = Date.strptime(session[:drop_off], '%m/%d/%Y')
    @pick = Date.strptime(session[:pick_up], '%m/%d/%Y')
    
    @booking_date = BookingDate.new
    # @booking_date_drop = BookingDate.new
    # @booking_date_pick = BookingDate.new
    # create.where book.date.date ? between ? 
    # find_or_create_by (create)
    # find_or_initialize_by (new)
    @total = (@pick - @drop).to_i * @sitter['price']


    #多筆操作 用transaction包
    
    if @order.save
      (@drop .. @pick).to_a.each do |day|
        BookingDate.find_or_initialize_by(sitter_id: @sitter['id'], date: day, available: false) do |booking_date|
          booking_date.save
        end
      end
      
      nonce = params[:payment_method_nonce]
      result = gateway.transaction.sale(
        amount: @total,
        payment_method_nonce: nonce,
        order_id: @order.id,
        options: {
          submit_for_settlement: true
        }
      )
      @order.pay!
      redirect_to user_orders_path, notice:'成功下訂！'
    else
      render :new
    end
  end

  def show
    @order = current_user.orders.find_by(id: params[:id])
  end
  
  def pending
    # Time.now.strftime('%Y-%m-%d').to_s
    @orders = current_user.orders.where("pick_up > '#{Time.now.strftime('%Y-%m-%d').to_s}'").page(params[:page]).per(5) 
  end
  
  def finish
    @orders = current_user.orders.where("pick_up < '#{Time.now.strftime('%Y-%m-%d').to_s}'").where(state: 'paid').page(params[:page]).per(5) 
  end
  
  def cancel
    @orders = current_user.orders.where(state: 'cancel').page(params[:page]).per(5) 
  end

  private
  def order_params
    params.require(:order).permit(:user_id, :sitter_id, :drop_off, :pick_up, :state, :note)
  end
  # def booking_date_params
  #   params.require(:booking_date).permit(:sitter_id, :date, :avaliable)
  # end

  
end
