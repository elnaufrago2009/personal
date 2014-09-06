class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  
  rescue_from CanCan::AccessDenied do |exception|
    if user_signed_in?
      if current_user.has_role? :superadmin
        redirect_to todos_registros_path
      elsif current_user.has_role? :admin
        redirect_to registros_path
      elsif current_user.has_role? :normal
        redirect_to inicios_path
      else
        redirect_to home_abouts_path
      end
    else              
      redirect_to "/users/sign_in"
    end 

    #redirect_to "/users/sign_in", :alert => exception.message
  end

  #protect_from_forgery with: :exception

  before_action :configure_permitted_parameters, if: :devise_controller?

  def configure_permitted_parameters
  	devise_parameter_sanitizer.for(:sign_up) << :first_name
  	devise_parameter_sanitizer.for(:sign_up) << :second_name
  	devise_parameter_sanitizer.for(:sign_up) << :mac
  	devise_parameter_sanitizer.for(:sign_up) << :area_id
  end
end
