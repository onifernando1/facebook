class Friendship < ApplicationRecord


    belongs_to :friend_one, class_name: "User", foreign_key: :friend_one_id
    belongs_to :friend_two, class_name: "User", foreign_key: :friend_two_id

    

    def create_inverse_relationship
        Friendship.create!(friend_one_id: self.friend_two.id, friend_two_id: self.friend_one.id)
    end 

    def update_friend_request_status_to_active
        @outdated_request = FriendRequest.find_by(sent_to_id:self.friend_two.id, sent_from_id:self.friend_one.id)
        @outdated_request.destroy
        
    end  

end
