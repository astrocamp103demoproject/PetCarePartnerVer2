class SittersController < ApplicationController
  before_action :authenticate_user!, except: [:index,:show]
  before_action :find_sitter,only: [:show, :edit, :update]

  def show
    session[:current_sitter] = @sitter
    @email_find_user = User.semail_to_uemail(@sitter.email)
    @pictures = Picture.where("user_id = ?",@email_find_user)
    @picture = Picture.new
    @booking_dates = @sitter.booking_dates.all
    @comments = @sitter.comments.all
    #設定日期
    @booking_date = BookingDate.new
    # byebug
    
    #判斷booking btn hidden
    @drop = session[:drop_off]
    @pick = session[:pick_up]


    #map
    # @result = Sitter.where('id NOT IN (?,?)',un_sitter_ids,un_current_sitter_id).where("pet_limit >= ?",pet_count).where("address LIKE ?",location_code).page(params[:page]).per(10)
    # @result = @sitter
    # g_map(@result)
    # render :show
  end

  def edit
  end

  def update
    if @sitter.update(sitter_params ) && @sitter.update(:address => address_connect)
      user = User.where("email = ?",@sitter.email)
      user.update(name: params[:sitter][:name])
      user.update(avatar: params[:sitter][:avatar])
      # binding.pry
      flash[:notice] = '更新成功'
      redirect_to sitter_path
    else
      render :edit
    end
  end
  
  def new
    @sitter = Sitter.new
  end
  def index
    @sitter = Sitter.new
  end
  def create
    
    @sitter = Sitter.new(become_sitter_form)
    @sitter.email = current_user.email
    @sitter.address = address_connect
    # byebug
    if @sitter.save
      User.update(role:'sitter')
      get_current_sitter
      redirect_to sitter_path(@current_sitter.id), notice:'恭喜你成為保母'
    else
      render :new
    end
  end
 
  private
  def sitter_params
    # byebug
    params.require(:sitter).permit( :name, :slogan, :price, :square_meters, :pet_limit, :date, :available, :pic, :avatar)
  end
  def become_sitter_form
    params.permit( :slogan, :price, :square_meters, :pet_limit)
  end
  def address_connect
    TaiwanCity.get(params[:city_id])+TaiwanCity.get(params[:township_id])+params[:address]
  end
  def booking_date_params
    params.require(:booking_date).permit(:sitter_id, :date)
  end
  def find_sitter
    @sitter = Sitter.find_by(id: params[:id])
  end



  # def g_map(result)
    

  #   @gmaps = result
  #   # byebug
  #   @hash = Gmaps4rails.build_markers(@gmaps) do |gmap, marker|      
  #     marker.lat gmap.latitude
  #     marker.lng gmap.longitude
  #     marker.infowindow gmap.address
  #     marker.picture({
  #       :url    => "http://www.blankdots.com/img/github-32x32.png",
  #       :width  => "32",
  #       :height => "32"
  #      })
  #     marker.title   gmap.name
  #     marker.json({ :id => gmap.id,:email => gmap.email,:price => gmap.price })
  #   end
    
  # end


end
