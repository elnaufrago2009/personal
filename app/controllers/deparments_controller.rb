class DeparmentsController < InheritedResources::Base
	def permitted_params
		params.permit!
	end
end
