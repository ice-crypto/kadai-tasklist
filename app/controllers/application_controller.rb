class ApplicationController < ActionController::Base
  include SessionsHelper

  def require_user_logged_in
      unless logged_in?
          redirect_to login_path
      end
  end

  def require_correct_user(task_id)
    if current_user.tasks.find_by(id: task_id)
    else
      redirect_to tasks_path
    end
  end
end
