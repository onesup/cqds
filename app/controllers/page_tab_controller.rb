class PageTabController < ApplicationController
  def index
    if request.params["signed_request"]
      if require_like == true
        if session[:facebook_uid]
          @user = current_user
        else
          @user = User.first
        end
      else
        redirect_to page_tab_gate_path
      end
    else
      if session[:facebook_uid]
        @user = current_user
      else
        @user = User.first
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
