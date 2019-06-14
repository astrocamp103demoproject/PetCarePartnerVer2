class SearchesController < ApplicationController
  before_action :authenticate_user!, except: [:index, :show]
  def show  
    pet_count
    @result = Sitter.where("pet_limit >= #{@pet_count}").where(address: location_code).page(params[:page]).per(10)
  end
  def update
    #1.用寵物數量找sitter
    # @sitters = Sitter.all.page(params[:page]).per(10)
    pet_count
    @result = Sitter.where("pet_limit >= #{@pet_count}").where(address: location_code).page(params[:page]).per(10) 
    
    
    #2.sitter找到後去booking_date
    
  end

  private 
  def location_code
    if (params[:city_id]=="縣市" || params[:township_id] == "")
      city = TaiwanCity.get("01000")
      township = TaiwanCity.get("01100")
    else
      city = TaiwanCity.get(params[:city_id])
      township = TaiwanCity.get(params[:township_id])
    end
    @location = city + township
  end

  def pet_count
    @pet_count = params[:xs_count].to_i + params[:s_count].to_i + params[:m_count].to_i + params[:l_count].to_i
  end
end
