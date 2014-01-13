class Admin::WallPostsController < ApplicationController
  before_action :authenticate_user!
  before_action :set_wall_post, only: [:show, :edit, :update, :destroy]
  layout 'admin'
  # GET /admin/wall_posts
  # GET /admin/wall_posts.json
  def index
    @wall_posts = WallPost.order("created_at desc")
  end

  # GET /admin/wall_posts/1
  # GET /admin/wall_posts/1.json
  def show
  end

  # GET /admin/wall_posts/new
  def new
    @wall_post = WallPost.new
  end

  # GET /admin/wall_posts/1/edit
  def edit
  end

  # POST /admin/wall_posts
  # POST /admin/wall_posts.json
  def create
    @wall_post = WallPost.new(admin_wall_post_params)

    respond_to do |format|
      if @wall_post.save
        format.html { redirect_to @wall_post, notice: 'Wall post was successfully created.' }
        format.json { render action: 'show', status: :created, location: @wall_post }
      else
        format.html { render action: 'new' }
        format.json { render json: @wall_post.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /admin/wall_posts/1
  # PATCH/PUT /admin/wall_posts/1.json
  def update
    respond_to do |format|
      if @wall_post.update(admin_wall_post_params)
        format.html { redirect_to @wall_post, notice: 'Wall post was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: 'edit' }
        format.json { render json: @wall_post.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /admin/wall_posts/1
  # DELETE /admin/wall_posts/1.json
  def destroy
    @wall_post.destroy
    respond_to do |format|
      format.html { redirect_to admin_wall_posts_url }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_wall_post
      @wall_post = WallPost.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def wall_post_params
      params[:wall_post]
    end
end
