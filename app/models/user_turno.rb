class UserTurno < ActiveRecord::Base
	belongs_to :user
	belongs_to :turno
end
