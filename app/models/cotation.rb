class Cotation < MailForm::Base

	CHOICES = ["Musée / Institution",  "Galerie", "Commissaire Priseur", "Artiste", "Particulier", "Autre"]
	DEMANDES = ["Exposition", "Manutention", "Stockage", "Transport", "Déménagement", "Autre"]
	attribute :name,      :validate => true
	attribute :email,     :validate => /\A([\w\.%\+\-]+)@([\w\-]+\.)+([\w]{2,})\z/i
	attribute :company
	attribute :tel
	attribute :choices
	attribute :oeuvres
	attribute :type
	attribute :address_enl
	attribute :address_liv
	attribute :description_oeuvres
	attribute :description_prestation
	attribute :date_depart
	attribute :date_fin
	attribute :nickname,  :captcha  => true

	# Declare the e-mail headers. It accepts anything the mail method
	# in ActionMailer accepts.
	def headers
	{
	  :subject => "Demande de cotation via le site Shipantiques.fr",
	  :to => ENV["GMAIL_USERNAME"],
	  :from => %("#{name}" <#{email}>)
	}
	end
end
