class PicturesController < ApplicationController
  before_action :authenticate_user!,except: [:index,:show]
  def index
    @user = User.find_by(id: params[:user_id])
    # byebug
  end
  def show
    @user = User.find_by(id: params[:user_id])
    next_pic
    
    @picture = Picture.find(params[:id])#找單張圖片
    
    # byebug
  end
  def new
    @picture = Picture.new
    # byebug
  end
  def create
    @picture = Picture.new(picture_params)
    if @picture.save
      redirect_to user_pictures_path(params[:user_id]), notice: '圖片上傳成功'
    else
      render :new
    end
    # byebug
  end

  private
  def picture_params
    params.require(:picture).permit( :pic, :user_id)
    # params.require(:sitter).permit( :address, :slogan, :price, :square_meters, :pet_limit, :pic)
  end
  def next_pic
    arr = Picture.where("user_id = ?",params[:user_id])
    newarr = []
    arr.map {|element| newarr << element.id } # 把hash.id丟出來存陣列
    
    session['beforepic'] = newarr[newarr.index(params[:id].to_i)-1]
    session['afterpic'] = newarr[newarr.index(params[:id].to_i)+1]
    # byebug
  end
end