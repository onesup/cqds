class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :null_session
  layout :layout_by_resource
  # protect_from_forgery with: :exception
  
  # before_filter :parse_facebook_cookies
  # def parse_facebook_cookies
  #   @oauth = Koala::Facebook::OAuth.new(FACEBOOK_CONFIG[:app_id], FACEBOOK_CONFIG[:app_secret])
  #   @facebook_params = @oauth.get_user_info_from_cookies(cookies)
  # end
  
  def authorized_user!
    unless user_logged_in?
      redirect_to root_path
    end
  end

  def user_logged_in?
    if current_user
      true
    else
      false
    end
  end
  
  helper_method :current_user

  private

    def current_user
      @current_user ||= User.find_by_uid(session[:facebook_uid]) if session[:facebook_uid]
    end
    
    def layout_by_resource
      if devise_controller?
        "admin"
      else
        "application"
      end
    end
  
end
