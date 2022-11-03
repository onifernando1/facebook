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
         has_many :friends, through: :friend_requests
         has_many :friend_requests
         
        
end
