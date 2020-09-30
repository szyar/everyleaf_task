class Admin::UsersController < ApplicationController
  before_action :set_user, only: [:show, :edit, :update, :destroy]
  before_action :require_user, except: [:new, :create]
  before_action :require_same_user, only: [:show, :edit, :update, :destroy]

  def index
    @users = User.all.order(created_at: :asc).paginate(page: params[:page], per_page: 5)
  end

  def show
    @tasks = @user.tasks.paginate(page: params[:page], per_page: 5)
  end

  def new
    @user = User.new
  end

  def edit
  end

  def create
    @user = User.new(user_params)
    @user.admin = true
    if @user.save
      session[:user_id] = @user.id
      flash[:notice] = "Welcome #{@user.admin}, you have successfully signed up"
      redirect_to admin_user_path(:id)
    else
      render 'new'
    end
  end

  def update
    if @user.update(user_params)
      flash[:notice] = "Account information was successfully updated"
      redirect_to admin_users_path
    else
      render 'edit'
    end
  end

  def destroy
    @user.destroy
    session[:user_id] = nil if @user == current_user
    flash[:notice] = "User account deleted successfully"
    redirect_to admin_users_path
  end

  private

  def user_params
    params.require(:user).permit(:username, :password, :email)
  end

  def set_user
    @user = User.find(current_user.id)
  end

  def require_same_user
    if current_user != @user && !current_user.admin?
      flash[:alert] = "You can only check and edit your own account"
      redirect_to tasks_path
    end
  end

end
