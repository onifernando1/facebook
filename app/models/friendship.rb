class Friendship < ApplicationRecord

    # after_create :create_inverse_relationship


    belongs_to :friend_one, class_name: "User", foreign_key: :friend1_id
    belongs_to :friend_two, class_name: "User", foreign_key: :friend2_id

    private

    # def create_inverse_relationship
        # friend1.friendships.create(friend1:friend2)
    # end 

end
