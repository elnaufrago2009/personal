class AssignRolesController < InheritedResources::Base
	def index
		@users = User.all		

		#@use = User.find(1)
		#@use.roles.find(1).destroy


		#user_to_remove = User.find(1)
		#role_to_remove = Role.find(1)
		#user_to_remove.role_to_remove.delete(role_to_remove)
		#role_to_remove = Role.find(params[:id])

		#user.roles.delete(role_to_remove)
	end

	def asignar
		user = User.find(params[:user_id])
		#@user.roles.find(params[:role][:id])
		user.roles << Role.find_by_name(params[:role_name])
		redirect_to assign_roles_path
	end

	def quitar
		user = User.find(params[:user_id])
		role_to_remove = Role.find_by_name(params[:role_name])
		user.roles.delete(role_to_remove)
		redirect_to assign_roles_path
	end
end
