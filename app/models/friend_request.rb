class FriendRequest < ApplicationRecord

    after_create :create_inverse_relationship

    belongs_to :sent_from, class_name: "User", foreign_key: "sent_from_id"
    belongs_to :sent_to, class_name: "User", foreign_key: "sent_to_id"


    private 

    def create_inverse_relationship
    end 
end
