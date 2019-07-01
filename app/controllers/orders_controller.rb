class OrdersController < ApplicationController
  include Payable
  # include ApplicationHelper
  before_action :authenticate_user!
  
  def index
    # byebug
    # @current_sitter = Sitter.find_by("name == '#{current_user.name}'")
    if @current_sitter.nil?
      @orders = Order.where("user_id = ?",current_user.id).page(params[:page]).per(5)
    else
      @orders = Order.where("user_id = ? OR sitter_id = ?",current_user.id,@current_sitter.id).page(params[:page]).per(5)
    end
    
    # byebug
    # @sitter = @orders.sitters.find_by(id:['sitter_id'])
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
        BookingDate.find_or_initialize_by(sitter_id: @sitter['id'], date: day, available: 'booked') do |booking_date|
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
    # @current_sitter = Sitter.find_by(name: current_user.name)
    if @current_sitter.nil?
      @order = Order.find_by("user_id = ?",current_user.id)
    else
      @order = Order.find_by("user_id = ? OR sitter_id = ?",current_user.id,@current_sitter.id)
    end
  end
  
  def pending
    # @current_sitter = Sitter.find_by("name == '#{current_user.name}'")
    if @current_sitter.nil?
      @orders = Order.where("user_id = ?",current_user.id).where("pick_up > '#{Time.now.strftime('%Y-%m-%d').to_s}'").page(params[:page]).per(5)
    else
      @orders = Order.where("user_id = ? OR sitter_id = ?",current_user.id,@current_sitter.id).where("pick_up > '#{Time.now.strftime('%Y-%m-%d').to_s}'").page(params[:page]).per(5)
    end
  end
  
  def finish
    # @current_sitter = Sitter.find_by("name == '#{current_user.name}'")
    if @current_sitter.nil?
      @orders = Order.where("user_id = ?",current_user.id).where("pick_up < '#{Time.now.strftime('%Y-%m-%d').to_s}'").where(state: 'paid').page(params[:page]).per(5)
    else
      @orders = Order.where("user_id = ? OR sitter_id = ?",current_user.id,@current_sitter.id).where("pick_up < '#{Time.now.strftime('%Y-%m-%d').to_s}'").where(state: 'paid').page(params[:page]).per(5)
    end
  end
  
  def cancel
    # @current_sitter = Sitter.find_by("name == '#{current_user.name}'")
    if @current_sitter.nil?
      @orders = Order.where("user_id = ?",current_user.id).where(state: 'cancel').page(params[:page]).per(5)
    else
      @orders = Order.where("user_id = ? OR sitter_id = ?",current_user.id,@current_sitter.id).where(state: 'cancel').page(params[:page]).per(5) 
    end
  end

  private
  def order_params
    params.require(:order).permit(:user_id, :sitter_id, :drop_off, :pick_up, :state, :note)
  end
  # def booking_date_params
  #   params.require(:booking_date).permit(:sitter_id, :date, :avaliable)
  # end
  
  
end