class CommentsController < ApplicationController
  before_action :set_comment, only: [:show, :edit, :update, :destroy]

  def index
    @comments = Comment.all
  end

  def show
  end

  def new
    @comment = Comment.new
  end

  def create
    @comment = Comment.new(comment_params)
    if @comment.save
      redirect_to @comment
      flash[:success] = 'comment was successfully created.'
    else
      render :new
    end
  end

  def edit
  end
  def update
    if @comment.update_attributes(comment_params)
      flash[:success] = 'Update successfully'
      redirect_to @comment
    else
      flash[:danger] = "sth is wrong"
    end
  end

  def destroy
    @comment.destroy
    redirect_to comments_url
  end

  private
  def comment_params
    params.require(:comment).permit(:body, :user_id, :post_id)
  end

  def set_comment
    @comment = Comment.find(params[:id])
  end

end
