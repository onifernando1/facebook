class UsersController < ApplicationController
    before_action :authenticate_user!

    def index
        @users = User.all 

        if params[:full_name] != nil 
            @users_found = User.where(full_name: params[:full_name])  
        end 
    end 

    def show
        @user = User.find(params[:id])
    end

end
