class UsersController < ApplicationController

  def destroy
  	redirect_to root_path
  end
  
  def admin
  	redirect_to user_session_path
  end
end
