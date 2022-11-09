class User < ApplicationRecord
        
        include Gravtastic
        gravtastic




  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable,:omniauthable, omniauth_providers: %i[facebook]

        #  validates :full_name, presence: true
        #  validates :birthday, presence: true
        #  validates :email, presence: true, uniqueness:true
        #  validates :password, presence: true, length:{minimum:3}
        

         has_many :posts #-> { order(created_at: :desc) }

         has_many :fr_sent, 
                  class_name:"FriendRequest", 
                  inverse_of: "sent_from", 
                  foreign_key: "sent_from_id"

         has_many :fr_received, 
                  class_name:"FriendRequest", 
                  inverse_of:"sent_to", 
                  foreign_key: "sent_to_id"

          has_many :pending_friend_requests, 
          -> {where "status = 'false'"},
          class_name:"FriendRequest",
          inverse_of:"sent_to",
          foreign_key:"sent_to_id"

         has_many :friend_requests

         has_many :friendships

        has_many :friendships_as_one, foreign_key: "friend_one_id", class_name: "Friendship"
        has_many :friends_as_one, through: :friendships_as_one, source: :friend_two

        has_many :friendships_as_two, foreign_key: "friend_two_id", class_name: "Friendship"
        has_many :friends_as_two, through: :friendships_as_one, source: :friend_one

        has_many :likes

        has_many :commented_posts, foreign_key: "commenter_id", class_name: "Comments"


        def self.from_omniauth(auth)
                find_or_create_by(provider: auth.provider, uid: auth.uid) do |user|
                  user.email = auth.info.email
                  user.password = Devise.friendly_token[0, 20]
                  user.full_name = auth.info.name   # assuming the user model has a name
                  # If you are using confirmable and the provider(s) you use validate emails, 
                  # uncomment the line below to skip the confirmation emails.
                  # user.skip_confirmation!
                end
        end
        
end
