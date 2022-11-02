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
end
