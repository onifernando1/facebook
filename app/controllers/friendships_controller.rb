class FriendshipsController < ApplicationController

    def new
        @friendship = Friendship.new() 
    end 

    def create
        
        @friendship = Friendship.new(friendship_params)
        if @friendship.save()
            #update friendrequests to active somehow
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

end
