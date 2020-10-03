class TasksController < ApplicationController
  before_action :set_task, only: [:show, :edit, :update, :destroy]
  before_action :require_user
  before_action :require_same_user, only: [:edit, :update, :destroy]

  def index
    @sort = params[:sort]
    if @sort
      @tasks = current_user.tasks.all.order(@sort).paginate(page: params[:page], per_page: 5)
    else
      @tasks = current_user.tasks.all.order(created_at: :desc).paginate(page: params[:page], per_page: 5)
    end
  end

  def search
    if params[:search_name].present? || params[:search_status].present?
      @results = Task.search(params[:search_name], params[:search_status])
    else
      redirect_to tasks_path
    end
  end

  def show
  end

  def new
    @task = Task.new
  end

  def create
    @task = Task.new(task_params)
    @task.user = current_user
    if @task.save
      flash[:notice] = "Task Created"
      redirect_to @task
    else
      render 'new'
    end
  end

  def edit
  end

  def update
    if @task.update(task_params)
      flash[:notice] = "Edited Successfully"
      redirect_to @task
    else
      render 'edit'
    end
  end

  def destroy
    if @task.destroy
      flash[:notice] = "Deleted Successfully"
      redirect_to tasks_path
    end
  end

  private

  def set_task
    @task = Task.find(params[:id])
  end

  def task_params
    params.require(:task).permit(:name, :detail, :expired_at,
      :status, :priority_type, label_ids: [])
  end

  def require_same_user
    if current_user != @task.user && !current_user.admin?
      flash[:alert] = "You can only edit or delete your own posts"
      redirect_to @task
    end
  end

end
