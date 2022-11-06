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
        @user_first_name = user_first_name()
    end 

    def create
        @post = Post.new(post_params)
        if @post.save
            redirect_to root_path
        else 
            render :new, status: :unprocessable_entity
        end  
    end 

    def edit
        @post = Post.find(params[:id]) 
    end 

    def update 
        @post = Post.find(params[:id]) 
        if @post.update(post_params)
            redirect_to @post
        else 
            render :edit, status: :unprocessable_entity
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

    def post_params
        params.require(:post).permit(:user_id, :information)
    end 

    def user_first_name
        name = current_user.full_name
        name = name.split(" ")
        name = name[0]
        name 
    end 
    
end
