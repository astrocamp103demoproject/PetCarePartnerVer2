class SearchesController < ApplicationController
  layout 'search'
  require 'date'
  skip_before_action :verify_authenticity_token
  before_action :authenticate_user!, except: [:index, :show, :update]

  def show
    @result = Sitter.where("pet_limit >= ?",pet_count).where("address LIKE ?",location_code).page(params[:page]).per(10) 
  end
  def update

      @result = Sitter.joins(:booking_dates).having(booking_dates: {date: subTraction(params[:Drop_Off],params[:Pick_Up]),available:true}).group(:sitter_id).where("pet_limit >= ?",pet_count).where("address LIKE ?",location_code).page(params[:page]).per(10) 
      # byebug
      session[:drop_off] = params[:Drop_Off]
      session[:pick_up] = params[:Pick_Up]
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
  
  #組成sql語法
  def dateSearch(sd,ed,sub)
    search = []
    #小於0就搜尋開始日
    if sub <= 0
      search << sd.to_s
    else
      0.upto(sub) do |i|
        #兩天相減＝0則是同天
        if sub == 0
          search = sd.to_s
        else
          search << (sd+i).to_s
        end
      end
    end
    search
  end

  def subTraction(drop,pick)
    #轉date相減後回傳,startdate,enddate,count
    if(drop=="" && pick=="")
      dateSearch("","",0)
    elsif(drop=="")
      endDate =  Date.strptime(pick, '%m/%d/%Y').to_date
      dateSearch(endDate,"",0)
    elsif (pick=="")
      startDate = Date.strptime(drop, '%m/%d/%Y').to_date
      dateSearch(startDate,"",0)
    else
      startDate = Date.strptime(drop, '%m/%d/%Y').to_date
      endDate =  Date.strptime(pick, '%m/%d/%Y').to_date
      counted = (endDate - startDate).to_i
  
      dateSearch(startDate,endDate,counted)
    end
      
  end


  # google map
  def g_map
    @gmaps = Sitter.where("pet_limit >= ?",pet_count).where("address LIKE ?",location_code)
    @hash = Gmaps4rails.build_markers(@gmaps) do |gmap, marker|
      marker.lat gmap.latitude
      marker.lng gmap.longitude
      marker.infowindow gmap.address
    end
  end
end
