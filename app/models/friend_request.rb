class FriendRequest < ApplicationRecord

    belongs_to :fr_sender, class_name: "User", foreign_key: "sent_from_id"
    belongs_to :fr_receiver, class_name: "User", foreign_key: "sent_to_id"

end
