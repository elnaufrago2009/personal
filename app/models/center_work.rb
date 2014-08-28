class CenterWork < ActiveRecord::Base
	has_many :areas
	belongs_to :deparment
end
