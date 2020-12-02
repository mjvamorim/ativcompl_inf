class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  before_action :configure_permitted_parameters, if: :devise_controller?
  before_action :set_locale
  protect_from_forgery with: :exception
  
  def configure_permitted_parameters
              devise_parameter_sanitizer.permit(:sign_up) { |u| u.permit({ roles: [] }, :nome, :email, :password, :password_confirmation, :username, :matricula, :curso, :tipo) }
              devise_parameter_sanitizer.permit(:account_update) { |u| u.permit( :email, :password, :current_password, :nome, :matricula, :curso, :tipo) }
   end
  
    def set_locale
            I18n.locale = params[:locale] || I18n.default_locale
    end
end
