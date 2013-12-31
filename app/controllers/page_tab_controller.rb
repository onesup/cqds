class PageTabController < ApplicationController
  def index
    puts "@@@@@@@@@@@@@@"
    puts request.POST['signed_request']
    puts "@@@@@@@@@@@@@@@"
    
    if request.params["signed_request"]
      if require_like == true
        if session[:facebook_uid]
          @user = current_user
        end
      else
        redirect_to page_tab_gate_path
      end
    else
      if session[:facebook_uid]
        @user = current_user
      end
    end
  end

  def fan_gate
    
  end
  
  def test

  end
  
  private

    def require_like
      result = true
      secret = FACEBOOK_CONFIG[:app_secret]
      req = request.params["signed_request"]
      page = Facebook::Request.parse_signed_request(req, secret)["page"]
      if page['liked'] == false
        return false
      else
        return true
      end
    end
  
end
