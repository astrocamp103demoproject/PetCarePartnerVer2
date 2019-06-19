class PetsController < ApplicationController
  before_action :authenticate_user!
  def new
    @pet = Pet.new
  end

  def create
    @pet = Pet.new(pet_params)

    if @pet.save
      redirect_to user_pet_path(current_user, @pet), notice:'寵物新增成功！'
    else
      render :new
    end
  end

  def show
    @pet = current_user.pets.find_by(id: params[:id])
  end

  def edit
    @pet = current_user.pets.find_by(id: params[:id])
  end

  def update
    @pet = current_user.pets.find_by(id: params[:id])

    if @pet.update(pet_params)
      redirect_to user_pet_path(current_user, @pet), notice:'修改成功！'
    else
      render :edit
    end
  end

  def destroy
    @pet = current_user.pets.find_by(id: params[:id])
    @pet.destroy if @pet
    flash[:notice] = '寵物資料已刪除'
    redirect_to user_path
  end
 
  private
  def pet_params
    params.require(:pet).permit(:user_id, :pet_type, :name, :size, :age, :sex, :breed, :pic, :note)
  end
end