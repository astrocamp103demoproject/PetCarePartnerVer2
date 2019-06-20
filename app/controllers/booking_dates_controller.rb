class BookingDatesController < ApplicationController
  # def create
  #   @booking_date = BookingDate.new(booking_date_params)
  #   @order = Order.new(order_params)
  #   @sitter = session[:current_sitter].to_h
  #   @drop = Date.strptime(session[:drop_off], '%m/%d/%Y')
  #   @pick = Date.strptime(session[:pick_up], '%m/%d/%Y')

  #   if @order.save
  #     (@drop .. @pick).to_a.each do |day|
  #       @booking_date.create(sitter_id: @sitter['id'], date: day, available: false)
  #     end
  #     redirect_to user_orders_path, notice:'成功下訂！'
  #   else
  #     render :new
  #   end
  # end

  private
  def booking_date_params
  params.require(:booking_date).permit(:sitter_id, :date, :avaliable)
  end
end
