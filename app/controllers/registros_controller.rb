class RegistrosController < InheritedResources::Base

	load_and_authorize_resource
	def index
		#selecciono todos los turrnos
		@turnos = Turno.all.order('id Desc')
		@todos = []
		#todos los usuarios de este administrador
		users = Admin.where("user_admin_id = ?", current_user.id)
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
			@turnos.each do |turno|
				@todos << Registro.where("(#{fields_user}) AND DATE(hora_entrada) = DATE(?) AND turno_id = ?",Date.today,turno.id).order('id Desc')
			end
			@pase = 1
		end
	end

	def usuarios
		@users = Admin.where("user_admin_id = ?", current_user.id)
	end

	def option_entrada
		registro = Registro.find(params[:registro_id])
		if registro.option_entrada == params[:options].to_i
			registro.update(:option_entrada => 0)
		else
			registro.update(:option_entrada => params[:options])
		end		
		redirect_to registros_path
	end


	def option_salida
		registro = Registro.find(params[:registro_id])
		if registro.option_salida == params[:options].to_i
			registro.update(:option_salida => 0)
		else
			registro.update(:option_salida => params[:options])
		end		
		redirect_to registros_path
	end

	def option_entrada_todos
		registro = Registro.find(params[:registro_id])
		if registro.option_entrada == params[:options].to_i
			registro.update(:option_entrada => 0)
		else
			registro.update(:option_entrada => params[:options])
		end
		redirect_to todos_registros_path
	end

	def option_salida_todos
		registro = Registro.find(params[:registro_id])
		if registro.option_salida == params[:options].to_i
			registro.update(:option_salida => 0)
		else
			registro.update(:option_salida => params[:options])
		end		
		redirect_to todos_registros_path
	end

	def todos

		@turnos = Turno.all.order('id Desc')
		@todos = []
		if !params[:q].nil?

			# si existe un nombre que buscar
			if !params[:q].blank?
				@users = User.where("LOWER(first_name) LIKE ? OR LOWER(second_name) LIKE ? OR CONCAT(first_name, ' ', second_name) LIKE ?", "%#{params[:q].downcase}%", "%#{params[:q].downcase}%","%#{params[:q].downcase}%")	
				fields_user = ""
				i = 1
				max = @users.count
				if max != 0
					@users.each do |user|
						if i == max
							fields_user << "user_id = #{user.id}"
						else
							fields_user << "user_id = #{user.id} OR "				
						end
						i = i + 1
					end			
					@turnos.each do |turno|
						@todos << Registro.where("(#{fields_user}) AND DATE(hora_entrada) = DATE(?) AND turno_id = ?",Date.today,turno.id).order('id Desc')
						#@todos << Registro.where("DATE(hora_entrada) = DATE(?) AND turno_id = ?", Date.today, turno.id).order('id Desc')
					end
				else
					@pase = 0
				end
				
			else
			#si el nombre esta en blanco deben salir todos				
				@turnos.each do |turno|
					@todos << Registro.where("DATE(hora_entrada) = DATE(?) AND turno_id = ?", Date.today, turno.id).order('id Desc')
				end
			end
			
		else
			# si no existe ningun q, o la primera vez que entra
			@turnos.each do |turno|
				@todos << Registro.where("DATE(hora_entrada) = DATE(?) AND turno_id = ?", Date.today, turno.id).order('id Desc')
			end
		end
		

		if @todos.count == 0
			@pase = 0
		else
			@pase = 1
		end
	end

	def message
		@registro = Registro.find(params[:registro_id])
	end

	def add_message
		registro = Registro.find(params[:registro_id])
		if params[:paridad] == '0'
			comentario = "#{registro.entrada_user_mensaje} <kbd><span class='glyphicon glyphicon-user'></span><strong> #{current_user.first_name} #{current_user.second_name} (admin)</strong></kbd> : #{params[:comentario]} <br/>"
			registro.update(:entrada_user_mensaje => comentario)
		else
			comentario = "#{registro.salida_user_mensaje} <kbd><span class='glyphicon glyphicon-user'></span><strong> #{current_user.first_name} #{current_user.second_name} (admin)</strong></kbd> : #{params[:comentario]} <br/>"
			registro.update(:salida_user_mensaje => comentario)
		end
		redirect_to message_registros_path(:paridad => params[:paridad], :registro_id => params[:registro_id])
	end

	def superadmin_message
		@registro = Registro.find(params[:registro_id])
	end

	def add_superadmin_message
		registro = Registro.find(params[:registro_id])
		if params[:paridad] == '0'
			comentario = "#{registro.entrada_user_mensaje} <kbd><span class='glyphicon glyphicon-user'></span> <strong>#{current_user.first_name} #{current_user.second_name} (SUPERADMIN)</strong></kbd> : #{params[:comentario]} <br>"
			registro.update(:entrada_user_mensaje => comentario)
		else
			comentario = "#{registro.salida_user_mensaje} <kbd><span class='glyphicon glyphicon-user'></span> <strong>#{current_user.second_name} (SUPERADMIN)</strong></kbd> : #{params[:comentario]} <br>"
			registro.update(:salida_user_mensaje => comentario)
		end
		redirect_to superadmin_message_registros_path(:paridad => params[:paridad], :registro_id => params[:registro_id])
	end

	def user_day
		@turnos = UserTurno.where("user_id = ?", params[:user_id])
		if @turnos.count == 0
			@pase = 0
		else
			@pase = 1
		end
		@todos = []
		@turnos.each do |turno|
			@todos << Registro.where("DATE(hora_entrada) = DATE(?) AND turno_id = ? AND user_id = ?", Date.today, turno.turno_id, params[:user_id]).order('id Desc')
		end		
	end

	def option_entrada_user
		registro = Registro.find(params[:registro_id])
		if registro.option_entrada == params[:options].to_i
			registro.update(:option_entrada => 0)
		else
			registro.update(:option_entrada => params[:options])
		end
		redirect_to user_day_registros_path(:user_id => params[:user_id])
	end

	def option_salida_user
		registro = Registro.find(params[:registro_id])
		if registro.option_salida == params[:options].to_i
			registro.update(:option_salida => 0)
		else
			registro.update(:option_salida => params[:options])
		end		
		redirect_to user_day_registros_path(:user_id => params[:user_id])
	end

	def user_day_registro
		@turnos = UserTurno.where("user_id = ?", params[:user_id])
		if @turnos.count == 0
			@pase = 0
		else
			@pase = 1
		end
		@todos = []
		@turnos.each do |turno|
			@todos << Registro.where("DATE(hora_entrada) = DATE(?) AND turno_id = ? AND user_id = ?", Date.today, turno.turno_id, params[:user_id]).order('id Desc')
		end	
	end

end