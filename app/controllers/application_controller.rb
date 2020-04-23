class ApplicationController < ActionController::Base
  include SessionsHelper

  def require_user_logged_in
      unless logged_in?
          redirect_to login_path
      end
  end

  def require_correct_user(task_id)
    if current_user && current_user.tasks.find_by(id: task_id)
    else
      redirect_to tasks_path
    end
  end
  
  rescue_from ActiveRecord::RecordNotFound, with: :render_404
  rescue_from ActionController::RoutingError, with: :render_404
  rescue_from Exception, with: :render_500

  def render_404
    render template: 'errors/error_404', status: 404, layout: 'application', content_type: 'text/html'
  end

  def render_500
    render template: 'errors/error_500', status: 500, layout: 'application', content_type: 'text/html'
  end
end
