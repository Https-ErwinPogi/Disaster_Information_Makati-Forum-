class PostsController < ApplicationController
  before_action :authenticate_user!,except: [:index]
  def index
    @posts = Post.includes(:user).all
  end

  def new
    @post = Post.new
  end

  def create
    @post = Post.new(params[:post].permit(:title, :content, :address))
    @post.user = current_user
    if @post.save
      redirect_to posts_path
    else
      render :new
    end
  end

  def show
    @post = Post.find(params[:id])
  end

  def edit
    @post = Post.find(params[:id])
  end

  def update
    @post = Post.find(params[:id])
    @post.user = current_user
    if @post.update(params[:post].permit(:title, :content, :address))
      redirect_to posts_path
    else
      render :edit
    end
  end

end
