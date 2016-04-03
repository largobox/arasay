class ShinyComment < ActiveRecord::Base

	has_many :shiny_comments
	belongs_to :user
	
end
