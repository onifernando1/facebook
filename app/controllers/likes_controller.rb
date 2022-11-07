class LikesController < ApplicationController

    def new
        @like = Like.new() 
    end 

    def create 
        @like = Like.new() 
        if @like.save
            redirect_to root_path
        else 
            redirect_to root_path, status: :unprocessable_entity
        end 
    end 

end
