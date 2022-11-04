class Friendship < ApplicationRecord

    belongs_to :friend1, class: "User", foreign_key: :friend1_id
    belongs_to :friend2, class: "User", foreign_key: :friend2_id

end
