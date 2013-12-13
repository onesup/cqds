class Admin::DashboardController < ApplicationController
  layout 'admin'
  
  def index
    @total_wall_posts_count = WallPost.count
    @heroes_count = Hero.last.total || 0
  end
  
  def wall_posts_count
    @wall_posts = WallPost
  end
  
  def heroes_count
    @heroes = Hero.all
  end
  
end
