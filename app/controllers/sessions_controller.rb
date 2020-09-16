class SessionsController < ApplicationController
  def new
    if logged_in?
      flash[:alert] = "Already Login"
      redirect_to tasks_path
    end
  end

  def create
    user = User.find_by(username: params[:session][:username].downcase)
    if user && user.authenticate(params[:session][:password])
      session[:user_id] = user.id
      flash[:notice] = "Logged in successfully"
      redirect_to tasks_path
    else
      flash[:danger] = "Invalid email or password"
      render 'new'
    end
  end

  def destroy
    session[:user_id] = nil
    flash[:notice] = "Logged out"
    redirect_to root_path
  end
end
