class Author < ActiveRecord::Base
    
    validates_uniqueness_of :name

    has_many :comic_authors
    has_many :comics, through: :comic_authors

end
  