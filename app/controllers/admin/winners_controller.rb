class Admin::WinnersController < ApplicationController
  before_action :authenticate_user!
  layout 'admin'
  before_action :set_winner, only: [:show, :edit, :winner]
  
  def index
    @winners = Winner.order("created_at desc")
  end

  def show
    
  end

  def new
    @user = User.new
  end
  
  def edit
    
  end
  
  def update
    respond_to do |format|
      if @winner.update(winner_params)
        format.html { redirect_to admin_user_path(@winner), notice: 'user was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: 'edit' }
        format.json { render json: @winner.errors, status: :unprocessable_entity }
      end
    end
  end
  
  private
    # Use callbacks to share common setup or constraints between actions.
    def set_winner
      @winners = Winner.find(params[:id])
    end  
    
    def winner_params
      params.require(:winner).permit(:id)
    end
    
end
