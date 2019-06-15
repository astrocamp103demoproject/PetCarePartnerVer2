class SearchesController < ApplicationController
  layout 'search'
  require 'date'
  before_action :authenticate_user!, except: [:index, :show, :update]
  def show
    @result = Sitter.where("pet_limit >= ?",pet_count).where(address: location_code).page(params[:page]).per(10)
  end
  def update
    #1.用寵物數量找sitter
    # @sitters = Sitter.all.page(params[:page]).per(10)
    
    # if(params[:Drop_Off]=="") && (params[:Pick_Up]=="")
      @result = Sitter.where("pet_limit >= ?",pet_count).where(address: location_code).page(params[:page]).per(10) 
    # else 
    #   @result = Sitter.joins(:booking_dates).where(date: date_change(params[:Drop_Off])..date_change(params[:Pick_Up])).page(params[:page]).per(10)
      # @a = BookingDate.group(:sitter_id).having(date: date_change(params[:Drop_Off])..date_change(params[:Pick_Up])) 
    # end

    # byebug
    # byebug
    
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
    params[:xs_count].to_i + params[:s_count].to_i + params[:m_count].to_i + params[:l_count].to_i
  end

  def date_change(day = "24/11/2018")
    day1 = day.split("/")
    DateTime.new(day1[2].to_i,day1[1].to_i,day1[0].to_i).strftime("%b %d,%Y")
  end
end
