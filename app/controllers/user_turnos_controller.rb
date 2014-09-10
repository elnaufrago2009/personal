class UserTurnosController < InheritedResources::Base
	load_and_authorize_resource
	def index
		@users = User.all.order('id Desc')
	end

	def asignar_turnos
		@user = User.find(params[:user_id])
		@turnos = Turno.all
		@user_turnos = UserTurno.where("user_id = ?", params[:user_id])
	end

	def agregar
		user_turno = UserTurno.create(:user_id => params[:user_id], :turno_id => params[:turno_id])
		redirect_to asignar_turnos_user_turnos_path(:user_id => params[:user_id])
	end

	def desasignar
		user_turno = UserTurno.find(params[:user_turno_id])
		user_id = user_turno.user_id
		user_turno.destroy
		redirect_to asignar_turnos_user_turnos_path(:user_id => user_id)
	end


	def permitted_params
		params.permit!
	end
end
