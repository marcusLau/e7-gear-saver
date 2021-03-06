class CommentsController < ApplicationController

    def index
        @comments = Comment.all
    end

    def new 
        @comment = Comment.new
        @gear = Gear.find_by(id: params[:gear_id])
        # @comment = Comment.find_by(params[:gear_id])
    end

    def create 
        @gear = Gear.find_by(id: params[:gear_id])
        @comment = @gear.comments.new(comment_params) # instiantes a comment with that gear id
        @comment.user = current_user
        # binding.pry
        if @comment.valid?
            @comment.save
            redirect_to gear_path(@gear)
        else
            render :new 
        end
    end 

    def show
        @comment = Comment.where("id = ?", params[:id])
        # @comment = Comment.find_by(id: params[:id])
    end

    private
    def comment_params
        params.require(:comment).permit(:content)
    end
end
