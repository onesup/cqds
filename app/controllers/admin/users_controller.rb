class Admin::UsersController < ApplicationController
  before_action :authenticate_user!
  layout 'admin'
  before_action :set_user, only: [:show, :edit, :update, :show]
  
  def index
    @users = User.order("created_at desc").page(params[:page]).per(2000)
  end

  def show
    
  end
  
  def edit
  end
  
  def update
    respond_to do |format|
      if @user.update(user_params)
        format.html { redirect_to admin_user_path(@user), notice: 'user was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: 'edit' }
        format.json { render json: @user.errors, status: :unprocessable_entity }
      end
    end
  end
  
  private
    # Use callbacks to share common setup or constraints between actions.
    def set_user
      @user = User.find(params[:id])
    end  
    
    def user_params
      params.require(:user).permit(:id, :email, :phone, :password, :name, :phone, :uid)
    end
end
