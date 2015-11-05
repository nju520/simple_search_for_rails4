class UsersController < ApplicationController

  before_action :set_user, only: [:show, :edit, :update, :destroy]
  def index
    # @users = User.all
    # @search = Search.new(:user, params[:search], :per_page => 2
    @search = Search.new(:user, params[:search])
    @search.order = 'first_name'
    @users = @search.run
    render 'users/index' # show this page
  end

  def show
  end

  def new
    @user = User.new
  end

  def create
    @user = User.new(user_params)
    if @user.save
      redirect_to @user
      flash[:success] = 'user was successfully created.'
    else
      render :new
    end
  end

  def edit
  end

  def update
    if @user.update_attributes(user_params)
      flash[:success] = 'Update successfully'
      redirect_to @user
    else
      flash[:danger] = "sth is wrong"
    end
  end

  def destroy
    @user.destroy
    redirect_to users_url
  end
  private
  def user_params
    params.require(:user).permit(:first_name, :last_name, :email, :address_id)
  end
  def set_user
    @user = User.find(params[:id])
  end
end
