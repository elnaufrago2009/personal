class IniciosController < InheritedResources::Base
	load_and_authorize_resource

	def index
		########################### Numero de fila activa ##########################################################
		@turnos = UserTurno.where("user_id = ?", current_user.id)
		@cantidad_turnos = @turnos.count * 2
		@max = @turnos.count
		@fields_turnos = ""
		if @max == 0
			@pase = 0
		else
			i = 1
			@turnos.each do |turno|
				if i == @max
					@fields_turnos << "turno_id = #{turno.turno.id}"
				else
					@fields_turnos << "turno_id = #{turno.turno.id} OR "
				end
				i = i + 1
			end
			@registros = Registro.where("(#{@fields_turnos}) AND user_id = ? AND DATE(hora_entrada) = DATE(?)", current_user.id, Date.today)		
			@cantidad_registros = @registros.count

			if @cantidad_registros == 0
				@fila = 1
			else
				@registros_ultimo = @registros.last
				if @registros_ultimo.register_turnos == 0
					@fila = @cantidad_registros*2
				else
					@fila = @cantidad_registros*2 + 1
				end
			end
		end

		

	end

	def horario_area
		########################################  horarios de area ########################################################
		
		@admin_asociado = Admin.where("user_normal_id = ?", current_user.id).first
		users = Admin.where("user_admin_id = ?",@admin_asociado[:user_admin_id])		
		@todos = []
		fields_user = ""
		max = users.count
		if max == 0
			@pase = 0
		else
			i = 1
			users.each do |user|
				if i == max
					fields_user << "user_id = #{user.user_normal_id}"
				else
					fields_user << "user_id = #{user.user_normal_id} OR "				
				end
				i = i + 1
			end	
			@turnos = UserTurno.where("#{fields_user}")
			@users_uniq = []
			@turnos.each do |turno|		
				@users_uniq << turno.turno_id				
			end
			@users_uniq = @users_uniq.uniq
			k = 1
			@users_uniq.each do |user_uniq|
				@todos << Registro.where("(#{fields_user}) AND DATE(hora_entrada) = DATE(?) AND turno_id = ?",Date.today,user_uniq).order('id Desc')
			end
			@pase = 1
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
			comentario = "#{registro.entrada_user_mensaje} <kbd><span class='glyphicon glyphicon-user'></span> <strong>#{current_user.first_name} #{current_user.second_name}</strong></kbd> :  #{params[:comentario]} <br/>"
			registro.update(:entrada_user_mensaje => comentario)
		else
			comentario = "#{registro.salida_user_mensaje} <strong><ins> #{current_user.first_name} #{current_user.second_name}</ins> : </strong> #{params[:comentario]} <br />"
			registro.update(:salida_user_mensaje => comentario)
		end

		redirect_to message_inicios_path(:paridad => params[:paridad], :registro_id => params[:registro_id])
	end


end
