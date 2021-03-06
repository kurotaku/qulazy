class UsersController < ApplicationController
  before_action :require_user_logged_in, only: [:index, :show, :edit]
  
  def index
    @users = User.all.page(params[:page])
  end

  def show
    @user = User.find(params[:id])
  end
  
  def new
    @user = User.new
  end
  
  def create
    @user = User.new(user_params)
    
    if @user.save
      flash[:success] = 'ユーザーを登録しました'
      redirect_to @user
    else
      render :new
    end
    
  end

  def edit
  end
  
  def posts
    @user = User.find(params[:id])
  end
  
  
  private
  
  def user_params
    params.require(:user).permit(:name, :username, :email, :password, :password_confirmation)
  end
  
end
