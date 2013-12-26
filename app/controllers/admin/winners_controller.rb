class Admin::WinnersController < ApplicationController
  layout 'admin'
  before_action :set_winner, only: [:show]
  
  def index
    @winners = Winner.order("created_at desc")
  end

  def show
    
  end
  
  private
    # Use callbacks to share common setup or constraints between actions.
    def set_winner
      @winners = Winner.find(params[:id])
    end  
end
