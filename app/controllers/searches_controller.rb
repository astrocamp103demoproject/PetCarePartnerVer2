class SearchesController < ApplicationController
  def show  
    @sitters = Sitter.all.page(params[:page]).per(10)
  end
  def update
    #1.用寵物數量找sitter
    # @sitters = Sitter.all.page(params[:page]).per(10)
    @pet_limit = params[:xs_count].to_i + params[:s_count].to_i + params[:m_count].to_i + params[:l_count].to_i
    
    @result = Sitter.where(pet_limit: @pet_limit).page(params[:page]).per(10)
    #2.sitter找到後去booking_date
    p params
  end
end
