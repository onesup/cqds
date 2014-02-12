class Admin::DonationsController < ApplicationController
  before_action :authenticate_user!
  layout 'admin'
  before_action :set_donation, only: [:show]
  
  def index
    @donations = Donation.order("created_at desc").page(params[:page]).per(2000)
  end
  
  def top_donators
    @users = User.top_donator.page(params[:page]).per(100)
  end

  def show
    
  end
  
  private
    # Use callbacks to share common setup or constraints between actions.
    def set_donation
      @donations = Donation.find(params[:id])
    end  
  
end
