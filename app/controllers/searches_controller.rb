class SearchesController < ApplicationController
  layout 'search'
  require 'date'
  # skip_before_action :verify_authenticity_token
  protect_from_forgery prepend: true
  before_action :authenticate_user!, except: [:index, :show, :update]

  def show
    # @result = Sitter.joins(:booking_dates).having(booking_dates: {date: subTraction(params[:Drop_Off],params[:Pick_Up]),available:true}).group(:sitter_id).where("pet_limit >= ?",pet_count).where("address LIKE ?",location_code).page(params[:page]).per(10)
    
    un_sitter_ids = BookingDate.where(date: date_change(params[:Drop_Off])..date_change(params[:Pick_Up]),available: false).map(&:sitter_id).uniq#uniq 清除重複的
    un_sitter_ids = un_sitter_ids.blank? ? [-1] : un_sitter_ids
    @result = Sitter.where('id NOT IN (?)',un_sitter_ids).where("pet_limit >= ?",pet_count).where("address LIKE ?",location_code).page(params[:page]).per(10) 
    g_map(@result)
  end
  
  def update
    un_sitter_ids = BookingDate.where(date: date_change(params[:Drop_Off])..date_change(params[:Pick_Up]),available: false).map(&:sitter_id).uniq#uniq 清除重複的
    un_sitter_ids = un_sitter_ids.blank? ? [-1] : un_sitter_ids
    @result = Sitter.where('id NOT IN (?)',un_sitter_ids).where("pet_limit >= ?",pet_count).where("address LIKE ?",location_code).page(params[:page]).per(10) 
    # @result = Sitter.joins(:booking_dates).having(booking_dates: {date: subTraction(params[:Drop_Off],params[:Pick_Up]),available:true}).group(:sitter_id).where("pet_limit >= ?",pet_count).where("address LIKE ?",location_code).page(params[:page]).per(10) 
# byebugs
    session[:drop_off] = params[:Drop_Off]
    session[:pick_up] = params[:Pick_Up]
    g_map(@result)
      
      
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
    if (day == "" || day.nil?)
      return ""
    else
      daysplit = day.split("/")
      "#{daysplit[2]}-#{daysplit[0]}-#{daysplit[1]}"
    end
  end
  


  # google map
  def g_map(result)
    

    @gmaps = result
    # byebug
    @hash = Gmaps4rails.build_markers(@gmaps) do |gmap, marker|      
      marker.lat gmap.latitude
      marker.lng gmap.longitude
      marker.infowindow gmap.address
      marker.picture({
        :url    => "http://www.blankdots.com/img/github-32x32.png",
        :width  => "32",
        :height => "32"
       })
      marker.title   gmap.name
      marker.json({ :id => gmap.id,:email => gmap.email })
    end
    
  end
end
