class Turno < ActiveRecord::Base
	self.inheritance_column = nil
	has_many :user_turnos
	has_many :registros
end