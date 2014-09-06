class RegistrosController < InheritedResources::Base

	load_and_authorize_resource
	def index
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
			@registros = Registro.where("(#{fields_user}) AND DATE(hora_entrada) = DATE(?)",Date.today)
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

	def todos
		@registros = Registro.where("DATE(hora_entrada) = DATE(?)", Date.today)

		if @registros.count == 0
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
			comentario = "#{registro.entrada_user_mensaje} <strong>#{current_user.first_name} (admin): </strong> #{params[:comentario]} <br>"
			registro.update(:entrada_user_mensaje => comentario)
		else
			comentario = "#{registro.salida_user_mensaje} <strong>#{current_user.first_name} (admin) : </strong> #{params[:comentario]} <br>"
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
			comentario = "#{registro.entrada_user_mensaje} <strong>#{current_user.first_name} (SUPERADMIN): </strong> #{params[:comentario]} <br>"
			registro.update(:entrada_user_mensaje => comentario)
		else
			comentario = "#{registro.salida_user_mensaje} <strong>#{current_user.first_name} (SUPERADMIN) : </strong> #{params[:comentario]} <br>"
			registro.update(:salida_user_mensaje => comentario)
		end
		redirect_to superadmin_message_registros_path(:paridad => params[:paridad], :registro_id => params[:registro_id])
	end

end