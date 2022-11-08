class CommentsController < ApplicationController

    def new
        @comment = Comment.new() 
    end 

    def create
        @comment = Comment.new(comment_params) 
        if @comment.save() 
            redirect_to root_path
        else 
            render root_path, status: :unprocessable_entity
        end 

    end 

    private

    def comment_params
        params.require(:comment).permit(:commenter_id, :post_id, :information)
    end 
end
