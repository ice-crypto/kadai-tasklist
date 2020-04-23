class TasksController < ApplicationController
  before_action :currect_user_set_task, only:[:show,:edit,:update,:destroy]
  before_action :require_user_logged_in

  def index
      @tasks = current_user.tasks.all.page(params[:page])
  end

  def new
    @task = current_user.tasks.build
  end

  def edit
  end

  def show
  end

  def create
    @task = current_user.tasks.build(task_params)
    
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
    @task.destroy
    flash[:success] = "タスクが削除されました。"
    redirect_to tasks_path
  end
  
  private
  
  def currect_user_set_task
    @task = Task.find_by(id: params[:id])
   if @task
     require_correct_user(@task.id)
   else
     flash[:danger] = "指定されたタスクIDが見つかりませんでした。"
     redirect_to root_path
   end
  end
  
  def task_params
    params.require(:task).permit(:content,:status)
  end
  
end
