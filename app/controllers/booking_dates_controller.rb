class BookingDatesController < ApplicationController
  before_action :authenticate_user!
  def new
    # @current_sitter = Sitter.find_by("name == '#{current_user.name}'")
    @booking_date = BookingDate.new

  end

  def create
    # @current_sitter = Sitter.find_by("name == '#{current_user.name}'")
    @booking_date = BookingDate.new(booking_date_params)
    @booking_date.available = 'closure'

    # byebug
    if @booking_date.save
      redirect_to sitter_path(@current_sitter), notice: '新增成功！'
    else
      render :new
    end
  end

  def destroy
    # @current_sitter = Sitter.find_by("name == '#{current_user.name}'")
    @booking_date = @current_sitter.booking_dates.find_by(id: params[:id])
    @booking_date.destroy if @booking_date
    flash[:notice] = '日期已開放'
    redirect_to sitter_path(@current_sitter)
  end

  private
  def booking_date_params
  params.require(:booking_date).permit(:sitter_id, :date, :avaliable)
  end
end
