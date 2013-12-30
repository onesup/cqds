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
    # respond_to do |format|
    #   if @user.update(user_params)
    #     format.html { redirect_to root_path, notice: 'User was successfully updated.' }
    #     # format.json { head :no_content }
    #   else
    #     format.html { render action: 'edit' }
    #     format.json { render json: @user.errors, status: :unprocessable_entity }
    #   end
    # end
  end
  
  private 
  
  def user_params
    params.require(:user).permit(:id, :uid, :name, :email, :phone_number)
  end
  
end
