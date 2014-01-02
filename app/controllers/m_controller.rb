class MController < ApplicationController
  layout 'mobile'

  def index
    puts "@@@@@@index"
    puts session[:facebook_uid] unless session[:facebook_uid].nil?
    unless session[:facebook_uid].nil?
      if check_like == true
        puts "@@@@@@ go to mobile_path"
        @user = current_user
      else
        puts "@@@@@@ go to mobile_gate_path"
        redirect_to mobile_gate_path
      end
    else
      redirect_to fb_login_path
    end
  end
  
  def fb_login
    puts "@@@@@@fb_login"
    puts session[:facebook_uid] unless session[:facebook_uid].nil?
    unless session[:facebook_uid].nil?
      if check_like == true
        puts "@@@@@@ go to mobile_path"
        redirect_to mobile_path
      else
        puts "@@@@@@ go to mobile_gate_path"
        redirect_to mobile_gate_path
      end
    else
      render :layout => false
    end    
  end
  
  def fan_gate
    puts "@@@@@@fan_gate"
    puts session[:facebook_uid] unless session[:facebook_uid].nil?
    unless session[:facebook_uid].nil?
      if check_like == true
        puts "@@@@@@ go to mobile_path"
        redirect_to mobile_path
      else
        puts "@@@@@@ go to mobile_gate_path"
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
        puts "auth error"
        session[:facebook_uid] = nil
        # redirect_to fb_login_path
        query = []
      rescue Koala::Facebook::ClientError
        puts "client error"
        session[:facebook_uid] = nil
        query = []
      end
      result = true unless query.empty?
      puts "@@@@@check_like@@@@"
      puts result
      puts "@@@@@@@@@"
      return result
    end
        
end