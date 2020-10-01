class Admin::UsersController < ApplicationController
  before_action :set_user, only: [:show, :edit, :update, :destroy]
  before_action :require_user, except: [:new, :create]
  before_action :require_same_user, only: [:show, :edit, :update, :destroy]

  def index
    if !current_user.admin?
      flash[:alert] = "Admin dashboard can be accessed only by admins"
      redirect_to tasks_path
    else
      @user = User.new
      @admins = User.where(admin: true).order(created_at: :asc).paginate(page: params[:page], per_page: 5)
      @users = User.where(admin: false).order(created_at: :asc).paginate(page: params[:page], per_page: 5)
    end
  end

  def create_by_admin
    @user = User.new(user_params)
    @user.save
    flash[:notice] = "New user created"
    redirect_to admin_dashboard_path
  end

  def show
    @tasks = @user.tasks.paginate(page: params[:page], per_page: 5)
  end

  def toggle
    @user = User.find(params[:id])
    @user.toggle!(:admin)
    @user.save
    redirect_to admin_dashboard_path
  end

  def new
    @user = User.new
  end

  def edit
  end

  def create
    @user = User.new(user_params)
    @user.admin = true
    @user.save
    if @user.save
      session[:user_id] = @user.id
      flash[:notice] = "Welcome #{@user.username}, you have successfully signed up"
      redirect_to admin_user_path(@user.id)
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
    redirect_to tasks_path
  end

  private

  def set_user
    @user = User.find(params[:id])
  end

  def user_params
    params.require(:user).permit(:username, :password, :email)
  end

  def require_same_user
    if current_user != @user && !current_user.admin?
      flash[:alert] = "You can only check and edit your own account"
      redirect_to tasks_path
    end
  end

end
