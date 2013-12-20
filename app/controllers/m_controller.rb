class MController < ApplicationController
  layout 'mobile'

  def index
    unless session[:facebook_uid].nil?
      redirect_to mobile_gate_path unless check_like
    else
      redirect_to mobile_gate_path
    end
  end
  
  def fb_login
    unless session[:facebook_uid].nil?    
      redirect_to mobile_gate_path if check_like
    else
      render :layout => false
    end    
  end
  
  def fan_gate
    unless session[:facebook_uid].nil?    
      redirect_to mobile_path if check_like
    else
      redirect_to fb_login_path
    end
  end
  
  private
    def check_like
      page_id = FACEBOOK_CONFIG[:page_id]
      access_token = session[:facebook_token]
      api = Koala::Facebook::API.new(access_token)
      begin
        result = api.get_connections("me","likes/" + page_id)
      rescue Koala::Facebook::AuthenticationError
        result = []
      rescue Koala::Facebook::ClientError
        result = []
      end
      return result.empty? ? false : true
    end
        
end
