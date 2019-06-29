class SittersController < ApplicationController
  before_action :authenticate_user!, except: [:index, :show]
  

  def show
    @sitter = Sitter.find_by(id: params[:id])
    session[:current_sitter] = @sitter
    @email_find_user = User.where("email = ?",@sitter.email).pluck(:id)
    # byebug
    picture = Picture.where("user_id = ?",@email_find_user).limit(4)#只會拿到五張
    @pic = picture.first  #第一個
    @pictures = picture.offset(1)#第二個開始

    @booking_dates = @sitter.booking_dates.all
    # byebug
    # @current_sitter = Sitter.find_by("name== '#{current_user.name}'")
  end

  def edit
    @sitter = Sitter.find_by(id: params[:id])
    # @booking_date = BookingDate.new
    # @pictures = @sitter.pictures.new(:user_id => )
    
  end

  def update
    @sitter = Sitter.find_by(id: params[:id])

    # @booking_date = BookingDate.new(booking_date_params)
    # @booking_date.available = false
    
    if @sitter.update(sitter_params)
      
      # byebug
      # @booking_date.save
      flash[:notice] = '更新成功'
      redirect_to sitter_path
    else
      render :edit
    end
  end
  def new
    @sitter = Sitter.new
  end
  def index
    @sitter = Sitter.new
  end
  def create
    
    @sitter = Sitter.new(become_sitter_form)
    @sitter.email = current_user.email
    @sitter.name = current_user.name
    @sitter.avatar = current_user.avatar

    @sitter.address = address_connect
    # byebug
    if @sitter.save
      User.update(role:'sitter')
      get_current_sitter
      redirect_to sitter_path(@current_sitter.id), notice:'恭喜你成為保母'
    else
      render :new
    end
  end
 
  private
  def sitter_params
    # byebug
    params.require(:sitter).permit( :address, :slogan, :price, :square_meters, :pet_limit, :date, :available, :pic, :avatar)
  end
  def become_sitter_form
    params.permit( :slogan, :price, :square_meters, :pet_limit)
  end
  def address_connect
    TaiwanCity.get(params[:city_id])+TaiwanCity.get(params[:township_id])+params[:address]
  end
  def booking_date_params
    params.require(:booking_date).permit(:sitter_id, :date)
  end
end
