class AdminsController < InheritedResources::Base
	load_and_authorize_resource
	def index
		@roles = Role.where(:name => 'admin')
		@admins = Admin.all
	end

	def asignar
		@admin = User.find(params[:user_admin_id])
		@users = User.where(:asignado => 0)
		@asignados = Admin.where(:user_admin_id => params[:user_admin_id])
	end

	def add_admin
		admins = Admin.new(:user_admin_id => params[:user_admin_id], :user_normal_id => params[:user_normal_id])
		admins.save
		user = User.find(params[:user_normal_id])
		user.update(:asignado => 1)		
		redirect_to asignar_admins_path(:user_admin_id => params[:user_admin_id])
	end

	def agregado

	end

	def quitar_user
		admin = Admin.find(params[:admin_id])
		admin.destroy
		user = User.find(params[:user_id])
		user.update(:asignado => 0)
		redirect_to asignar_admins_path(:user_admin_id => params[:user_admin_id])
	end




	def permitted_params
		params.permit!
	end
end
