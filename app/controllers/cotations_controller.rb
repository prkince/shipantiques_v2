class CotationsController < ApplicationController
	skip_before_action :authenticate_user!
	
	def new
		@cotation = Cotation.new
	end

	def create
		@cotation = Cotation.new(params[:cotation])
		@cotation.request = request

		@cotation.choices = params[:cotation][:choices]
		if  @cotation.choices == [""]
			@cotation.choices = nil
		end 

		@cotation.type = params[:cotation][:type]
		if  @cotation.type == [""]
			@cotation.type = nil
		end 

		if @cotation.oeuvres != nil
			@cotation.oeuvres = params[:cotation][:oeuvres]
			@cotation.oeuvres.each do |actiondispatch|
				Cloudinary::Uploader.upload(actiondispatch.tempfile,folder:"/Cotations")
			end
			@cotation.oeuvres = 'Le client à télécharger des images, se rendre sur www.cloudinary.com / Media Library / Cotations Folder pour accéder aux images'
		end

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
