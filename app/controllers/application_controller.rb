class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  rescue_from CanCan::AccessDenied do |exception|
    redirect_to root_url, :alert => exception.message
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
