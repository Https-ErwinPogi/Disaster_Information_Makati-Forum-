class CommentsController < ApplicationController
  before_action :authenticate_user!, except: :index
  before_action :set_post
  before_action :set_comment, only: [:edit, :update, :destroy]
  before_action :validate_comment_owner, only: [:edit, :update, :destroy]

  def index
    @comments = @post.comments
  end

  def new
    @comment = @post.comments.build
  end

  def create
    @comment = @post.comments.build(params_comment)
    @comment.user = current_user
    if @comment.save
      redirect_to post_path(params[:post_id])
    else
      render :new
    end
  end

  def edit ;end

  def update
    if @comment.update(params_comment)
      redirect_to post_path(params[:post_id])
    else
      render :edit
    end
  end

  def destroy
    @comment.destroy
    redirect_to post_path(params[:post_id])
  end

  private
  def set_comment
    @comment = @post.comments.find(params[:id])
  end

  def params_comment
    params.require(:comment)
          .permit(:content)
          .merge(post_id: params[:post_id])
  end

  def set_post
    @post = Post.find(params[:post_id])
  end

  def validate_comment_owner
    unless @comment.user == current_user
      flash[:notice] = 'the comment not belongs to you'
      redirect_to post_comments_path(@post)
    end
  end
end
