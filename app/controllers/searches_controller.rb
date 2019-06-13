class SearchesController < ApplicationController
  def show  
    @result = Sitter.all.page(params[:page]).per(10)
  end
  def update
    #1.用寵物數量找sitter
    # @sitters = Sitter.all.page(params[:page]).per(10)
    @pet_limit = params[:xs_count].to_i + params[:s_count].to_i + params[:m_count].to_i + params[:l_count].to_i
    @result = Sitter.where(pet_limit: @pet_limit).where(address: location_code).page(params[:page]).per(10)

    
    #2.sitter找到後去booking_date
    puts "-------------------"
    puts params
    puts location_code
    puts @result
    puts "-------------------"
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
end
