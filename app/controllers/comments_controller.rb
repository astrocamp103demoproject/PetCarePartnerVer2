class CommentsController < ApplicationController
    before_action :authenticate_user!
    def index
        
        @sitter = Sitter.find_by(id: params["sitter_id"])
        @comments = @sitter.comments
    end

    def new
        @sitter = Sitter.find_by(id: params["sitter_id"])
        @comment = Comment.new
    end

    def create
        @sitter = Sitter.find_by(id: params["sitter_id"])
        @comment = Comment.new(comment_params)
        
        if @comment.save 
            session[:order_status] = "waitting"
            redirect_to sitter_path(@sitter.id), notice: '已留下評價'
        end
    end

    private
    def comment_params
        params.require(:comment).permit(:sitter_id, :user_id, :message)
    end
end
