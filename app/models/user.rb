class User < ActiveRecord::Base

    validates :username, :password, :email, presence: true
    validates :username, uniqueness: true
    validates :email, uniqueness: true
    has_secure_password

    has_many :comic_users
    has_many :comics, through: :comic_users

end