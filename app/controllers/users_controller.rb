class UsersController < ApplicationController

  def destroy
  	redirect_to_root_path
  end
  
  def admin
  	redirect_to_user_session_path
  end
end
