class UsersController < ApplicationController
  before_action :authenticate_user!

  def show
    @user = current_user
    @pets = current_user.pets.all
    @pictures = Picture.where("sitter_id = ? OR user_id = ?",current_user.id,current_user.id).limit(5)#只會拿到四張
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
