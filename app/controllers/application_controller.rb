class ApplicationController < ActionController::Base
  before_action :basic_auth
  
  before_action :configure_permitted_parameters, if: :devise_controller?

  protected
  
  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:sign_up, keys: [:nikename,:fist_name,:list_name,:fist_name_kana,:list_name_kana,:birth_day,:email])
  end
  
  private 
  def basic_auth
    authenticate_or_request_with_http_basic do |username, password|
      username == 'rikuo' && password == '0514' 
    end  
  end
end
