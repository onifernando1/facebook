class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

         validates :full_name, presence: true
         validates :birthday, presence: true
         validates :email, presence: true, uniqueness:true
         validates :password, presence: true, length:{minimum:3}

         has_many :posts

         has_many :fr_sent, 
                  class_name:"FriendRequest", 
                  inverse_of: "sent_from", 
                  foreign_key: "sent_from_id"

         has_many :fr_received, 
                  class_name:"FriendRequest", 
                  inverse_of:"sent_to", 
                  foreign_key: "sent_to_id"

         has_many :friend_requests

         has_many :friendships

         has_many :friends, through: :friendships, source: :user      
        
end
