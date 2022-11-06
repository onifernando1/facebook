class FriendRequest < ApplicationRecord


    belongs_to :sent_from, class_name: "User", foreign_key: "sent_from_id"
    belongs_to :sent_to, class_name: "User", foreign_key: "sent_to_id"


    
end
