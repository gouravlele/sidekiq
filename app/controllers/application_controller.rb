class ApplicationController < ActionController::Base
  require 'csv'
   respond_to :html, :json,:csv
  protect_from_forgery with: :exception
  before_action :configure_permitted_parameters, if: :devise_controller?
  before_action :authenticate_user!
  def authenticated_user
    if current_user
      current_user
    else
      'Gourav lele'
    end
  end
  protected
    def configure_permitted_parameters
      added_attrs = [:username, :email,:mobile_no, :password, :password_confirmation, :remember_me,:avatar]
      devise_parameter_sanitizer.permit :sign_up, keys: added_attrs
      devise_parameter_sanitizer.permit :account_update, keys: added_attrs
    end
end
