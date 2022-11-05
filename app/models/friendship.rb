class Friendship < ApplicationRecord

    # after_create :create_inverse_relationship


    belongs_to :friend_one, class_name: "User", foreign_key: :friend_one_id
    belongs_to :friend_two, class_name: "User", foreign_key: :friend_two_id

    

    def create_inverse_relationship
        Friendship.create!(friend_one_id: self.friend_two.id, friend_two_id: self.friend_one.id)
    end 

end
