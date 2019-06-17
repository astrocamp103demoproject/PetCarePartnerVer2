class SittersController < ApplicationController
  before_action :authenticate_user!, except: [:index, :show]
  def show
    @sitter = Sitter.find_by(id: params[:id])
    session[:current_sitter] = @sitter
  end
  def edit
    @sitter = Sitter.find_by(id: params[:id])
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
    # @sitter = current_user
    @sitter = Sitter.new(sitter_params)
    @sitter.email = current_user.email
    @sitter.name = current_user.name

    User.update(role:'sitter')
    if @sitter.save
      redirect_to root_path, notice:'恭喜你成為保母'
    else
      render :new
    end
  end
 
  private
  def sitter_params
    params.require(:sitter).permit( :address, :slogan, :price, :square_meters, :pet_limit)
  end
  
end
