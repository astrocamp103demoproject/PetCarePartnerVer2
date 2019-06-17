class SearchesController < ApplicationController
  require 'date'
  layout 'search'
  skip_before_action :verify_authenticity_token
  before_action :authenticate_user!, except: [:index, :show, :update]

  def show
    @result = Sitter.where("pet_limit >= ?",pet_count).where("address LIKE ?",location_code).page(params[:page]).per(10) 
  end
  def update
      @result = Sitter.where("pet_limit >= ?",pet_count).where("address LIKE ?",location_code).page(params[:page]).per(10) 
      @date_count = BookingDate.where(date: date_change(params[:Drop_Off])..date_change(params[:Pick_Up])).where(sitter_id: 220).count
      
      g_map
      
      
  end

  private 
  def location_code
    p_city = params[:city_id]
    p_town = params[:township_id]
    if (p_city =="縣市" && p_town == "")
      city = TaiwanCity.get("")
      township = TaiwanCity.get("")
    elsif (p_city != "" && p_town == "")
      city = TaiwanCity.get(p_city)
      township = TaiwanCity.get("")
    else
      city = TaiwanCity.get(p_city)
      township = TaiwanCity.get(p_town)
    end
    @location = city + "%" + township + "%"
  end

  def pet_count
    params[:xs_count].to_i + params[:s_count].to_i + params[:m_count].to_i + params[:l_count].to_i
  end

  def date_change(day)
      if (day == "")
        return ""
      else
        daysplit = day.split("/")
        "#{daysplit[2]}-#{daysplit[0]}-#{daysplit[1]}"
      end
  end

  def g_map
    # google map
    @gmaps = Sitter.where("pet_limit >= ?",pet_count).where("address LIKE ?",location_code)
    @hash = Gmaps4rails.build_markers(@gmaps) do |gmap, marker|
      marker.lat gmap.latitude
      marker.lng gmap.longitude
      marker.infowindow gmap.address
    end
  end
end
