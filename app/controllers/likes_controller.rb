class LikesController < ApplicationController

    def new
        @like = Like.new() 
    end 

    def create 
        @like = Like.new(like_params) 
        if @like.save
            redirect_to root_path
        else 
            redirect_to root_path, status: :unprocessable_entity
        end 
    end 

    private

    def like_params
        params.require(:like).permit(:user_id, :post_id)
    end
end
