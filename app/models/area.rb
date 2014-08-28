class Area < ActiveRecord::Base
	belongs_to :center_work
	has_many :users
end
