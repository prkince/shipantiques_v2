class CotationsController < ApplicationController
	skip_before_action :authenticate_user!
	
	def new
		@cotation = Cotation.new
	end

	def create
		@cotation = Cotation.new(params[:cotation])
		@cotation.request = request
		@cotation.oeuvres = params[:cotation][:oeuvres][0]
		if @cotation.deliver
		  flash.now[:notice] = 'Votre demande de cotation à bien été transmise, nous allons revenir vers vous au plus vite'
		else
		  flash.now[:error] = 'Merci de vérifier votre saisie svp'
		  render :new
		end
	end

	private

	def contact_params
		params.require(:cotation).permit(:email, :name, :company, :tel, :message, :choices, :oeuvres, :type, :address_enl, :address_liv, :description_oeuvres, :description_prestation, :date_depart, :date_fin)
	end  

end
