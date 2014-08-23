class AssignRolesController < InheritedResources::Base
	def index
		@users = User.all

		user = User.find(1)
		role_to_remove = Role.find(1)
		user.roles.delete(role_to_remove)

		#@use = User.find(1)
		#@use.roles.find(1).destroy


		#user_to_remove = User.find(1)
		#role_to_remove = Role.find(1)
		#user_to_remove.role_to_remove.delete(role_to_remove)
		#role_to_remove = Role.find(params[:id])

		#user.roles.delete(role_to_remove)
	end
end
