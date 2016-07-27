class PostsController < ApplicationController
  before_action :set_post, only: [:show, :edit, :update, :destroy]


  def index
  @posts = Post.all.order("created_at ASC")
  end

  def show
     render layout: "show"
  end

  def new
  @post = current_user.posts.build
  end

  def edit
  end

  def create
  @post = current_user.posts.build(post_params)
  if @post.save
    redirect_to @post, notice: 'Post was successfully created.'
  else
    render :new
  end
  end

  def update
  if @post.update(post_params)
    redirect_to @post, notice: 'Post was successfully updated.'
  else
    render :edit
  end
  end

  def destroy
  @post.destroy
  redirect_to posts_url
  end

  private
  # Use callbacks to share common setup or constraints between actions.
  def set_post
    @post = Post.find_by(id: params[:id])
  end

  def correct_user
    @post = current_user.posts.find_by(id: params[:id])
    redirect_to posts_path, notice: "Not authorized to edit this post" if     @post.nil?
  end

  # Never trust parameters from the scary internet, only allow the white list through.
  def post_params
    params.require(:post).permit(:title, :body, :user_id, :image)
  end


end
