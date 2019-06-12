class SearchController < ApplicationController
    def index
        @sitters = Sitter.all.page(params[:page]).per(10)
        
    end

end