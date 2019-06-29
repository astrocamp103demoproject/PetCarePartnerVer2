class UsersController < ApplicationController
  before_action :authenticate_user!

  def show
    @user = current_user
    @pets = current_user.pets.all
    
    picture = Picture.where("user_id = ?",params[:id]).limit(4)#只會拿到五張
    @pic = picture.first  #第一個
    @pictures = picture.offset(1)#第二個開始
    # byebug
  end

  def update
    @user = current_user
    
    if @user.update(user_params)
      flash[:notice] = '更新成功'
      redirect_to user_path
    else
      render :edit
    end
  end
  
  private
  def user_params
    params.require(:user).permit(:name, :email, :address, :avatar, :pic, :latitude, :longitude)
  end

end
