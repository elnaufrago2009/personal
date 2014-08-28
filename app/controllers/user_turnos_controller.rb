class UserTurnosController < InheritedResources::Base

	def index
		@users = User.all
	end

	def asignar_turnos
		@user = User.find(params[:user_id])
		@turnos = Turno.all
		@user_turnos = UserTurno.all
	end

	def permitted_params
		params.permit!
	end
end
