class UsersController < ApplicationController  
  
  def create
    uid = params["uid"]
    access_token = params["access_token"]
    user = User.create_or_find_fan!(uid, access_token)
    session[:facebook_uid] = uid
    session[:facebook_token] = access_token
    Donation.registering(user)
    respond_to do |format|
      format.html { render nothing: true }
      format.json { render action: 'total_donations', status: :created }
    end
  end
  
  def update
    @user = User.find_by_uid params[:id]
    @user.update(user_params)
    render nothing: true
  end
  
  private 
  
  def user_params
    params.require(:user).permit(:id, :uid, :name, :email, :phone_number)
  end
  
end