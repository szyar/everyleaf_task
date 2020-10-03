class LabelsController < ApplicationController
  before_action :set_label, only: [:show, :edit, :update, :destroy]
  before_action :require_user
  before_action :require_same_user, only: [:edit, :update, :destroy]

  def index
    @labels = current_user.labels.all.paginate(page: params[:page], per_page: 5)
  end

  def search
    @label = Label.find(params[:label_id])
    @results = @label.tasks
  end

  def show
  end

  def new
    @label = Label.new
  end

  def edit
  end

  def create
    @label = Label.new(label_params)
    @label.user = current_user
    if @label.save
      flash[:notice] = "Label Created"
      redirect_to @label
    else
      render 'new'
    end
  end

  def update
    if @label.update(label_params)
      flash[:notice] = "Edited Successfully"
      redirect_to @label
    else
      render 'edit'
    end
  end

  def destroy
    if @label.destroy
      flash[:notice] = "Deleted Successfully"
      redirect_to labels_path
    end
  end

  private

  def set_label
    @label = Label.find(params[:id])
  end

  def label_params
    params.require(:label).permit(:name)
  end

  def require_same_user
    if current_user != @label.user && !current_user.admin?
      flash[:alert] = "You can only edit or delete your own labels"
      redirect_to @label
    end
  end
end
