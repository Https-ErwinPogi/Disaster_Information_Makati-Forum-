class Admin::PostsController < AdminController
  def index
    @posts = Post.includes(:user, :categories, :region, :province).order(comments_count: :desc).kept.page(params[:page]).per(7)
  end
end
