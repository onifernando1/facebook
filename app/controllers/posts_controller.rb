class PostsController < ApplicationController

    def index
        @posts = Post.all
        @list_of_ids = get_ids()
        @timeline_posts = Post.where(user_id: @list_of_ids)
    end 

    def show
        @post = Post.find(params[:id])
    end 

    def new
        @post = Post.new 
    end 

    def create
        @post = Post.new(post_params)
        if @post.save
            redirect_to root_path
        else 
            render :new, status: :unprocessable_entity
        end  
    end 

    private 

    def get_friend_ids
        list_of_ids = current_user.friends_as_one.pluck(:id)
    end 

    def add_own_id(list_of_ids)
        list_of_ids << current_user.id
    end 

    def get_ids
        list_of_ids = get_friend_ids()
        list_of_ids = add_own_id(list_of_ids)
        list_of_ids
    end 

    
end
