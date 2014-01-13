class Admin::UsersController < ApplicationController
  before_action :authenticate_user!
  layout 'admin'
  before_action :set_user, only: [:show]
  
  def index
    @users = User.order("created_at desc")
  end

  def show
    
  end
  
  private
    # Use callbacks to share common setup or constraints between actions.
    def set_user
      @users = User.find(params[:id])
    end  
end
