class UsersController < ApplicationController
    before_action :authenticate_user!

    def index
        @users = User.all 

        if params[:full_name] != nil 
            full_name = params[:full_name].downcase
            capitalize_first_letters(full_name)
            @users_found = User.where(full_name: params[:full_name])  
            redirect_to friend_requests_path
        end 
    end 

    def show
        @user = User.find(params[:id])
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
