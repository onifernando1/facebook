class FriendshipsController < ApplicationController

    def new
        @friendship = Friendship.new() 
    end 

    def create
        
        @friendship = Friendship.new(friendship_params)
        if @friendship.save()
            # @friend_requests = FriendRequest.all
            @friendship.update_friend_request_status_to_active()
            @friendship.create_inverse_relationship() 
            redirect_to root_path
        else 
            render root_path, status: :unprocessable_entity
        end  
    end 

    private 

    def friendship_params
        params.require(:friendship).permit(:friend_one_id, :friend_two_id)
    end 

    # def update_friend_request_status_to_active
    #     @outdated_request = FriendRequest.find_by(sent_to_id:current_user.id, sent_from_id:@friendship.friend_one.id)
    #     @outdated_request.status = true # delete/destroy if right 
    #     puts @outdated_request
    # end  

end
