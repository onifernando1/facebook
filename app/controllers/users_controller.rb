class UsersController < ApplicationController
    before_action :authenticate_user!

    def index
        @users = User.all 
        if params[:full_name] != nil 
            full_name = params[:full_name].downcase
            full_name = capitalize_first_letters(full_name)
            @users_found = User.where(full_name: full_name)  
        end 

    end 

    def show
        @user = User.find(params[:id])
        @friend_request = FriendRequest.new()
        @friend_requests = FriendRequest.all
    end

    def new 
        @user = User.new()
        @friend_request = FriendRequest.new()
    end 

    def create 
        @user = User.find(params[:id])
        @friend_request = FriendRequest.new()
        if @friend_request.save
            redirect_to user_path(@user)
        else 
            render :new, status: :unprocessable_entity
        end 
    end 


    private 

    def capitalize_first_letters(name)
        name_array = name.split(" ")
        new_name_array = []
        name_length = name_array.length
        for i in (0..name_length - 1 )
            new_name_array << name_array[i].capitalize()
        end
        new_name = new_name_array.join(" ")
        new_name
    
    end 


 
end
