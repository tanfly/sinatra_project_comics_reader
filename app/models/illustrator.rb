class Illustrator < ActiveRecord::Base

    validates_uniqueness_of :name

    has_many :comic_illustrators
    has_many :comics, through: :comic_illustrators

end