class UsersController < ApplicationController
  before_action :set_user, only: [:edit, :update, :show, :destroy]

  def index
    @users = User.all
   end

   def set_user
     @user = User.find(params[:id])
    end

  def new
    require_user
    @user = User.new
  end

  def create
    require_user
    @user = User.new(user_params)
    if @user.save
      flash[:success] = "Welcome to the alpha blog #{@user.username}"
      redirect_to articles_path
    else
     render 'new'
    end
  end

  def edit
    require_user
    @user = User.find(params[:id])
  end

  def update
    require_user
    @user = User.find(params[:id])
    if @user.update(user_params)
     flash[:success] = "Your account was updated successfully"
     redirect_to articles_path
    else
     render 'edit'
    end
   end

  def delete
    require_user
  end

  def show
    @user = User.find(params[:id])
    @articles = Article.all.where(:user_id => @user.id )
  end

  def destroy
    require_user
    @user.destroy
    flash[:notice] = "L'administrateur a été supprimé."
    redirect_to users_path
  end

  private
    def user_params
      params.require(:user).permit(:username, :email, :password)
    end


end
