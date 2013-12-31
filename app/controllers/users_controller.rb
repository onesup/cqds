class UsersController < ApplicationController  
  def create
    uid = params["uid"]
    access_token = params["access_token"]
    User.create_or_find_fan!(uid, access_token)
    session[:facebook_uid] = uid
    session[:facebook_token] = access_token
    render nothing: true
  end
  
  def update
    @user = User.find params[:id]
    @user.update(user_params)
    render nothing: true
  end
  
  private 
  
  def user_params
    params.require(:user).permit(:id, :uid, :name, :email, :phone_number)
  end
  
end