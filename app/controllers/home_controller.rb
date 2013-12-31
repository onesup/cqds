class HomeController < ApplicationController
  def index
    # reset_session
    @user_agent = UserAgent.parse(request.user_agent)
    if @user_agent.mobile?
      flash[:facebook_params] = request.env['facebook.params']
      redirect_to mobile_path
    else
      puts "@@@@first@@@@@@@"
      puts request.params["page"]
      puts "@@@@@@@@@@"
      flash[:facebook_params] = request.env['facebook.params']
      redirect_to FACEBOOK_CONFIG[:page_tab_address]
    end
  end
  
  def page_tab_gate

  end
  
  def mobile_gate

  end
  
  def please_like_this_page

  end
  
  def game_result
    @result = Gift.first.is_win?(current_user, Time.now)
  end
  
  def canvas
    page_id = FACEBOOK_CONFIG[:page_id]
    @oauth = Koala::Facebook::OAuth.new(FACEBOOK_CONFIG[:app_id], FACEBOOK_CONFIG[:app_secret])
    # if session[:facebook_token].nil?
      @facebook_params = @oauth.get_user_info_from_cookies(cookies) if session[:facebook_token].nil?
      # @facebook_params = @oauth.get_token_from_session_key(session)
      if session[:facebook_token].nil?
        access_token = @facebook_params['access_token']
        uid = @facebook_params['user_id']
      else
        access_token = session[:facebook_token]
        uid = session[:user_id]
      end
      @new_access_info = @oauth.exchange_access_token_info(access_token)
      @rest = Koala::Facebook::RestAPI.new(access_token)
      user = User.create_or_find_fan!(uid, access_token)
      
      @result = @rest.fql_query("SELECT page_id FROM page_fan WHERE uid=me() AND page_id=" + page_id)
      unless @result == []
        # redirect_to 
      end
      session[:facebook_uid] = user.uid
      session[:facebook_token] = user.token.access_token
    # else
    #   @rest = Koala::Facebook::RestAPI.new(session[:facebook_token])
    #   @result = @rest.fql_query("SELECT page_id FROM page_fan WHERE uid=me() AND page_id=" + page_id)
    # end
    
  end
    
  private

    def require_like
      unless request.env['facebook.params'].nil?
        facebook_params = request.env['facebook.params']
        if facebook_params['page']['liked'] == false
          redirect_to please_like_this_page_path
        else
          user = User.create_or_find_fan!(facebook_params['user_id'], facebook_params['oauth_token'])
          session[:facebook_uid] = user.uid
          session[:facebook_token] = user.token.access_token
        end
      end
    end
  
end
