class UsersController < ApplicationController
  def show
    @user = User.find 1
    # @user = User.find_by(id: params[:id])
  end

end
