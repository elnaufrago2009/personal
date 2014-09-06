class IniciosController < InheritedResources::Base
	load_and_authorize_resource

	def index	

		# turnos que tiene el usuario
		@user_turnos = UserTurno.where("user_id = ?", current_user.id)
		#cantidad de turnos
		@user_turnos_count = @user_turnos.count*2

		@registros_user = Registro.where('user_id = ? AND DATE(hora_entrada) = DATE(?)', current_user.id, Date.today)
		
		
		########################### Numero de fila activa ##########################################################
		@turnos = UserTurno.where("user_id = ?", current_user.id)
		@cantidad_turnos = @turnos.count * 2

		registros = Registro.where('user_id = ? AND DATE(hora_entrada) = DATE(?)', current_user.id, Date.today)		
		@cantidad_registros = registros.count

		if @cantidad_registros == 0
			@fila = 1
		else
			@registros_ultimo = registros.last
			if @registros_ultimo.register_turnos == 0
				@fila = @cantidad_registros*2
			else
				@fila = @cantidad_registros*2 + 1
			end
		end

	end


	def registrar_turno
		paridad = params[:paridad].to_i
		if paridad == 0
			registro = Registro.create(:turno_id => params[:turno_id], :user_id => params[:user_id], :hora_entrada => Time.now.strftime('%Y-%m-%d %H:%M:%S'), :register_turnos => 0)
			redirect_to inicios_path
		elsif paridad == 1
			registro = Registro.find_by(:turno_id => params[:turno_id], :user_id => params[:user_id], :hora_entrada => Date.today)
			registro.update(:register_turnos => 1, :hora_salida => "#{Time.now.strftime('%Y-%m-%d %H:%M:%S')}")
			redirect_to inicios_path
		end
	end

	def registrar_paridad
		registro = Registro.find(params[:registro_id])
		registro.update(:register_turnos => 1, :hora_salida => Time.now.strftime('%Y-%m-%d %H:%M:%S'))
		redirect_to inicios_path
	end

	def message
		@registro = Registro.find(params[:registro_id])
	end

	def envio_message
		registro = Registro.find(params[:registro_id])
		if params[:paridad] == '0'
			comentario = "#{registro.entrada_user_mensaje} <strong>#{current_user.first_name} : </strong> #{params[:comentario]} <br>"
			registro.update(:entrada_user_mensaje => comentario)
		else
			comentario = "#{registro.salida_user_mensaje} <strong>#{current_user.first_name} : </strong> #{params[:comentario]} <br>"
			registro.update(:salida_user_mensaje => comentario)
		end

		redirect_to message_inicios_path(:paridad => params[:paridad], :registro_id => params[:registro_id])
	end


end
