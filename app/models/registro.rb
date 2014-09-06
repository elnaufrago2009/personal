class Registro < ActiveRecord::Base
	belongs_to :turno
	belongs_to :user
end
