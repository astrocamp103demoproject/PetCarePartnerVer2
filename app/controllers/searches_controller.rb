class SearchesController < ApplicationController
  def show  
    @sitters = Sitter.all.page(params[:page]).per(10)
  end
  def update
    @sitters = Sitter.all.page(params[:page]).per(10)
  end
end
