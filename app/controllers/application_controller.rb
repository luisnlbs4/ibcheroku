class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :null_session

  def configure_permitted_parameters
    devise_parameter_sanitizer.for(:sign_up).push(:name,:last_name)
  	devise_parameter_sanitizer.for(:account_update).push(:name,:last_name)
  end

  def user_auth
		redirect_to "/" unless  user_signed_in?
  end
end
