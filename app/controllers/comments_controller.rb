class CommentsController < ApplicationController

    def index
        @comments = Comment.all
    end

    def new 
        @comment = Comment.new(gear_id: params[:gear_id])
    end

    def create 
        @comment = Comment.create(comment_params) 
        if @comment
            @comment.user = current_user
            @comment.save 
            redirect_to comment_path(@comment) 
        else
            render :new 
        end
    end 

    def show
        @comment = Comment.find_by(id: params[:id])
    end

    private
    def comment_params
        params.require(:comment).permit(:content)
    end
end
