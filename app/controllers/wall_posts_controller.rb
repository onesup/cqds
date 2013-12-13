class WallPostsController < ApplicationController
  def create
    @user_agent = UserAgent.parse(request.user_agent)
    unless session[:facebook_uid]
      redirect_to root_path
    else
      user = User.find_by_uid(session[:facebook_uid])
      @wall_post = user.wall_posts.new(wall_post_params)    
      respond_to do |format|
        if @wall_post.save
          @wall_post.post
          if flash[:facebook_params].nil? or @user_agent.mobile?
            format.html { redirect_to mobile_path }
          else
            format.html { redirect_to page_tab_path }
          end
          format.json { render json: @wall_post, status: :created, location: @wall_post }
        else
          format.html { redirect_to root_path }
          format.json { render json: @wall_post.errors, status: :unprocessable_entity }
        end
      end
    end
  end
  
  private  
  
    def wall_post_params
      params.require(:wall_post).permit(:message, :user_id)
    end
  
end
