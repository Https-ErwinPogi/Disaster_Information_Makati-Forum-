class PostsController < ApplicationController
  before_action :authenticate_user!, except: [:index, :show]
  before_action :set_post, only: [:show, :edit, :update, :destroy]
  before_action :validate_post_owner, only: [:edit, :update, :destroy]

  def index
    @posts = Post.includes(:user, :categories).order(comments_count: :desc).kept.page(params[:page]).per(7)
    @hot_posts = Post.order(comments_count: :desc).limit(3).select{ |post| post.comments_count >= 1 }
    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @posts, each_serializer: PostSerializer }
    end
  end

  def new
    @post = Post.new
  end

  def create
    @post = Post.new(post_params)
    @post.user = current_user
    if Rails.env.development?
      @post.ip_address = Net::HTTP.get(URI.parse('http://checkip.amazonaws.com/')).squish
    else
      @post.ip_address = request.remote_ip
    end
    if @post.save
      flash[:notice] = 'The post was successfully saved'
      redirect_to posts_path
    else
      render :new
    end
  end

  def show
    respond_to do |format|
      format.html
      format.json { render json: @post, serializer: PostSerializer }
      end
  end

  def edit ;end

  def update
    if @post.update(post_params)
      flash[:notice] = 'The post is up to date'
      redirect_to posts_path
    else
      render :edit
    end
  end

  def destroy
    if @post.comments_count >= 1
      flash[:notice] = "The post with comments can't be deleted."
    else @post.discard
    flash[:notice] = "The post was successfully deleted."
    end
    redirect_to posts_path
  end

  def short_url
    # route_list = RouteList.find_by(unique_id: params[:unique_id])
    # unique_num
    # post = Post.find_by unique_id: 8998
    # redirect_to action: "show", id: post.id
    @post = Post.find_by(unique_id: params[:unique_id])
    redirect_to post_path(@post)
  end

  private

  def set_post
    @post = Post.find(params[:id])
  end

  def post_params
    params.require(:post).permit(:title, :content, :address, :unique_id, category_ids: [])
  end

  def validate_post_owner
    unless @post.user == current_user
      flash[:notice] = 'This post not belongs to you'
      redirect_to posts_path
    end
  end
end
