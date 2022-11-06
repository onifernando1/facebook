class FriendRequestsController < ApplicationController

    
    def index
        @friend_requests = FriendRequest.all 
    end 
    
    
    def new 
       @friend_request = FriendRequest.new()
    end 

    def create 
        # @user = User.find(params[:id])
        @friend_request = FriendRequest.new(friend_request_params)
        if @friend_request.save
            redirect_to root_path
        else 
            render user_path(current_user), status: :unprocessable_entity, id: @user.id
        end  
            
    end 

    private

    def friend_request_params
        params.require(:friend_request).permit(:sent_from_id, :sent_to_id)
    end 





end
