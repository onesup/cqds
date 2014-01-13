class UsersController < ApplicationController  

  def create
    uid = params["uid"]
    access_token = params["access_token"]
    user = User.create_or_find_fan!(uid, access_token)
    session[:facebook_uid] = uid
    session[:facebook_token] = access_token
    Donation.registering(user)
    total_donations = Donation.count * 100
    today_limit = user.daily_donations(Time.now)
    data = {total_donations: total_donations, today_limit: today_limit}
    respond_to do |format|
      format.html {render nothing: true}
      format.json {render json: data}
    end
  end
  
  def update
    @user = User.find_by_uid params[:id]
    @user.update(user_params)
    render nothing: true
  end
  
  private 
  
  def user_params
    params.require(:user).permit(:id, :uid, :name, :email, :phone_number, :password, :data)
  end
end