class SittersController < ApplicationController
  before_action :authenticate_user!, except: [:index, :show]
  def show
    @sitter = Sitter.find_by(id: params[:id])
    session[:current_sitter] = @sitter
    
    @booking_dates = @sitter.booking_dates.all
    
    # @current_sitter = Sitter.find_by("name == '#{current_user.name}'")
  end

  def edit
    @sitter = Sitter.find_by(id: params[:id])
    # @pictures = @sitter.pictures.new(:user_id => )
    
  end
  def update
    @sitter = Sitter.find_by(id: params[:id])
    
    if @sitter.update(sitter_params)
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
    
    @sitter = Sitter.new(sitter_params)
    @sitter.email = current_user.email
    @sitter.name = current_user.name
    @sitter.avatar = current_user.avatar
    
    
    User.update(role:'sitter')
    if @sitter.save
      @current_sitter = Sitter.find_by("name == '#{current_user.name}'")
      redirect_to sitter_path(@current_sitter.id), notice:'恭喜你成為保母'
    else
      render :new
    end
  end
 
  private
  def sitter_params
    params.require(:sitter).permit( :address, :slogan, :price, :square_meters, :pet_limit, :pic)
  end
  
end
