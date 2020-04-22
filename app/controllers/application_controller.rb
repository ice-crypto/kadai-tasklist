class ApplicationController < ActionController::Base
    include SessionsHelper
    
    def require_user_logged_in
        unless logged_in?
            redirect_to login_path
        end
    end
end
