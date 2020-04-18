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
    @task = Task.new(task_params)
    
    if @task.save
      flash[:success] = "タスクの追加が完了しました。"
      redirect_to @task
    else
      flash.now[:danger] = "保存できませんでした。"
      render :new
    end
  end

  def update
    if @task.update(task_params)
      flash[:success] = "更新が完了しました。"
      redirect_to @task
    else
      flash.now[:danger] = "更新が失敗しました。"
      render :edit
    end
  end

  def destroy
    id = @task[:id]
    @task.destroy
    flash[:success] = "id#{id}のタスクが削除されました。"
    redirect_to tasks_path
  end
  
  private
  
  def set_task_found_id
    @task = Task.find(params[:id])
  end
  
  def task_params
    params.require(:task).permit(:content,:title)
  end
  
end
