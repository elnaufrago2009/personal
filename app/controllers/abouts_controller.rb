class AboutsController < InheritedResources::Base

	load_and_authorize_resource
	def index	
		if user_signed_in?	
			if current_user.has_role? :superadmin
		      	redirect_to todos_registros_path
		    else     	
		    	if current_user.has_role? :admin
		    		redirect_to registros_path
		    	else
		    		if current_user.has_role? :normal
		    			redirect_to inicios_path
		    		else
		    			redirect_to home_abouts_path
		    		end
		    	end
		    end	
		end
	end

	def home
	end
end
