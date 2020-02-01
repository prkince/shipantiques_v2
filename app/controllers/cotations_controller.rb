class CotationsController < ApplicationController
	skip_before_action :authenticate_user!
	
	def new
		@cotation = Cotation.new
	end

	def create
		@cotation = Cotation.new(params[:cotation])
		@cotation.request = request
		if @cotation.deliver
		  flash.now[:notice] = 'Thank you for your message. We will contact you soon!'
		else
		  flash.now[:error] = 'Cannot send message.'
		  #render :new
		end
	end

	private

	def contact_params
		params.require(:cotation).permit(:email, :name, :message)
	end  

end
