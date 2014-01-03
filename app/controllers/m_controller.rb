class MController < ApplicationController
  layout 'mobile'

  def index
    Rails.logger.info "@@@@@@index"
    Rails.logger.info session[:facebook_uid] unless session[:facebook_uid].nil?
    unless session[:facebook_uid].nil?
      if check_like == true
        Rails.logger.info "@@@@@@ go to mobile_path"
        @user = current_user
      else
        Rails.logger.info "@@@@@@ go to mobile_gate_path"
        redirect_to mobile_gate_path
      end
    else
      redirect_to fb_login_path
    end
  end
  
  def fb_login
    Rails.logger.info "@@@@@@fb_login"
    Rails.logger.info session[:facebook_uid] unless session[:facebook_uid].nil?
    unless session[:facebook_uid].nil?
      if check_like == true
        Rails.logger.info "@@@@@@ go to mobile_path"
        redirect_to mobile_path
      else
        Rails.logger.info "@@@@@@ go to mobile_gate_path"
        redirect_to mobile_gate_path
      end
    else
      render :layout => false
    end    
  end
  
  def fan_gate
    Rails.logger.info "@@@@@@fan_gate"
    Rails.logger.info session[:facebook_uid] unless session[:facebook_uid].nil?
    unless session[:facebook_uid].nil?
      if check_like == true
        Rails.logger.info "@@@@@@ go to mobile_path"
        redirect_to mobile_path
      else
        if check_like == "auth error"
          redirect_to fb_login_path
        else
          Rails.logger.info "@@@@@@ go to mobile_gate_path"
        end
      end
    else
      redirect_to fb_login_path
    end    
    
  end
  
  private
    def check_like
      page_id = FACEBOOK_CONFIG[:page_id]
      token = current_user.token.access_token
      # access_token = session[:facebook_token]
      api = Koala::Facebook::API.new(token)
      result = false
      begin
        query = api.get_connections("me","likes/" + page_id)
      rescue Koala::Facebook::AuthenticationError
        Rails.logger.info "auth error"
        session[:facebook_uid] = nil
        # redirect_to fb_login_path
        query = "auth error"
      rescue Koala::Facebook::ClientError
        Rails.logger.info "client error"
        session[:facebook_uid] = nil
        query = []
      end
      result = true unless query.empty?
      result = "auth error" if query == "auth error"
      Rails.logger.info "@@@@@check_like@@@@"
      Rails.logger.info result
      Rails.logger.info "@@@@@@@@@"
      return result
    end
        
end