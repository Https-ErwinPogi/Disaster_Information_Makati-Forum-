class CommentsController < ApplicationController
  before_action :authenticate_user!,except: [:index]
  before_action :set_post
  before_action :set_comment, only: [:edit, :update]

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
      redirect_to post_comments_path(@post)
    else
      render :new
    end
  end

  def edit ;end

  def update
    if @comment.update(params_comment)
      redirect_to post_comments_path
    else
      render :edit
    end
  end

  private
  def set_comment
    @comment = @post.comments.find(params[:id])
  end

  def params_comment
    params.require(:comment).permit(:content)
  end

  def set_post
    @post = Post.find(params[:post_id])
  end
end
