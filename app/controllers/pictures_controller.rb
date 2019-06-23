class PicturesController < ApplicationController
    
  def show
    @sitter = Sitter.find_by(id: params[:id])
  end
  def new
    @picture = Picture.new
    @current_sitter = Sitter.find_by("name == '#{current_user.name}'")
    # byebug
  end
  def create
    @picture = Picture.new(picture_params)
    
    # byebug
  end

  private
  def picture_params
    params.require(:picture).permit( :pic)
    # params.require(:sitter).permit( :address, :slogan, :price, :square_meters, :pet_limit, :pic)
  end
end