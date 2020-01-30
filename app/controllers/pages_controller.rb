class PagesController < ApplicationController
  skip_before_action :authenticate_user!, only: [:home, :services, :specialites, :contact, :infos, :nous_rejoindre, :cotations, :mentions_legales]

  def home
  end

  def services
  end 

  def specialites
  end

  def contact
  end  

  def infos
  end  

  def nous_rejoindre
  end  

  def cotations
  end  

  def mentions_legales
  end
  
end
