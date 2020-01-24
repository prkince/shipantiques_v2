class PagesController < ApplicationController
  skip_before_action :authenticate_user!, only: [:home, :services, :specialites, :contact]

  def home
  end

  def services
  end 

  def specialites
  end

  def contact
  end  
end
