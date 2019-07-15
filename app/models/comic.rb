class Comic < ActiveRecord::Base

    validates_uniqueness_of :title

    has_many :comic_users
    has_many :users, through: :comic_users
    has_many :comic_authors
    has_many :authors, through: :comic_authors
    has_many :comic_illustrators
    has_many :illustrators, through: :comic_illustrators

end