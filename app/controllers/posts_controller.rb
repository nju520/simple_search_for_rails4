class PostsController < ApplicationController

  before_action :set_post, only: [:show, :edit, :update, :destroy]

  def index
    # @posts = Post.all
    @search = Search.new(:post, params[:search])
    @search.order = 'created_at'
    @posts = @search.run
    render 'posts/index'
  end

  def show
  end

  def new
    @post = Post.new
  end

  def create
    @post = Post.new(post_params)
    if @post.save
      redirect_to @post
      flash[:success] = 'post was successfully created.'
    else
      render :new
    end
  end

  def edit
  end
  def update
    if @post.update_attributes(post_params)
      flash[:success] = 'Update successfully'
      redirect_to @post
    else
      flash[:danger] = "sth is wrong"
    end
  end

  def destroy
    @post.destroy
    redirect_to posts_url
  end

  private
  def post_params
    params.require(:post).permit(:body, :user_id, :title)
  end

  def set_post
    @post = Post.find(params[:id])
  end

end
