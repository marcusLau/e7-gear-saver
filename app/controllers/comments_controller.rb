class CommentsController < ApplicationController
    def new 
        @comment = Comment.new
    end

    def create 
        @comment = Comment.create(comment_params) 
        if @comment.valid? 
            @comment.save 
            redirect_to comment_path(@comment) 
        else
            render :new 
        end
    end 

    def show
        
    end

    private
    def comment(params)
        params.require(:comment).permmit(:content)
    end
end
