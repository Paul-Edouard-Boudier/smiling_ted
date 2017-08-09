# All Administrate controllers inherit from this `Admin::ApplicationController`,
# making it the ideal place to put authentication logic or other
# before_actions.
#
# If you want to add pagination or other controller-level concerns,
# you're free to overwrite the RESTful controller actions.
module Admin
  class ApplicationController < Administrate::ApplicationController
    before_action :authenticate_admin!

    def authenticate_admin!
      if current_user
        user_not_authorized unless current_user.admin
      else
        getlogin
      end
    end


    private

    def user_not_authorized
      flash[:alert] = "It seems that you are not an admin"
      redirect_to root_path
    end

    def getlogin
      flash[:notice] = "Thanks to login with admin credantials"
      redirect_to new_user_session_path
    end

  end
end
