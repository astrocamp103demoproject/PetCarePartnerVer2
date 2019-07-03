class SittersController < ApplicationController
  before_action :authenticate_user!, except: [:index,:show]
  before_action :find_sitter,only: [:show, :edit, :update]

  def show
    session[:current_sitter] = @sitter
    @email_find_user = User.semail_to_uemail(@sitter.email)
    @pictures = Picture.where("user_id = ?",@email_find_user)
    
    @booking_dates = @sitter.booking_dates.all
    @comments = @sitter.comments.all
    #設定日期
    @booking_date = BookingDate.new
    # byebug
    
  end

  def edit
  end

  def update
    # @sitter.address = address_connect
    if @sitter.update(sitter_params ) && @sitter.update(:address => address_connect)
      user = User.where("email = ?",@sitter.email)
      user.update(name: params[:sitter][:name])
      user.update(avatar: params[:sitter][:avatar])
      # binding.pry
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
    params.require(:sitter).permit( :name, :slogan, :price, :square_meters, :pet_limit, :date, :available, :pic, :avatar)
  end
  def become_sitter_form
    params.permit( :slogan, :price, :square_meters, :pet_limit, :avatar, :name)
  end
  def address_connect
    TaiwanCity.get(params[:city_id])+TaiwanCity.get(params[:township_id])+params[:address]
  end
  def booking_date_params
    params.require(:booking_date).permit(:sitter_id, :date)
  end
  def find_sitter
    @sitter = Sitter.find_by(id: params[:id])
  end
end
