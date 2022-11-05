class FriendshipsController < ApplicationController

    def new
        @friendship = Friendship.new() 
    end 

    def create
        
        @friendship = Friendship.new(friendship_params)
        if @friendship.save()
            #update friendrequets to active somehow 
            redirect_to root_path
        else 
            render root_path, status: :unprocessable_entity
        end  
    end 

    private 

    def friendship_params
        params.require(:friendship).permit(:friend1_id, :friend2_id)
    end 

end
