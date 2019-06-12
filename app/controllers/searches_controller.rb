class SearchesController < ApplicationController
  def show  

  end
  def create
    @sitters = Sitter.all.page(params[:page]).per(10)
    p 'ssssss'
    p params
  end
end
