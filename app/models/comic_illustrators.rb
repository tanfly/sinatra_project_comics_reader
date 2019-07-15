class ComicIllustrator < ActiveRecord::Base
    belongs_to :comic 
    belongs_to :illustrator 
end