class TasksController < ApplicationController
  before_action :set_task_found_id, only:[:show,:edit,:update,:destroy]
  
  def index
    @tasks = Task.all.page(params[:page])
  end

  def new
    @task = Task.new
  end

  def edit
  end

  def show
  end

  def create
    @task = Task.new(message_params)
    
    if @task.save
      flash[:success] = "タスクの追加が完了しました。"
      redirect_to @task
    else
      flash.now[:danger] = "保存できませんでした。"
      render :new
    end
  end

  def update
  end

  def destroy
  end
  
  private
  
  def set_task_found_id
    @task = Task.find(params[:id])
  end
  
  def message_params
    params.require(:task).permit(:content,:title)
  end
  
end
