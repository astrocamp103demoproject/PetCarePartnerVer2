class SittersController < ApplicationController
  def show
    @sitter = Sitter.find_by(id: params[:id])
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


  private
  def sitter_params
    params.require(:sitter).permit(:name, :email, :address, :slogan, :avatar, :price, :square_meters, :pet_limit, :pic)
  end

end
