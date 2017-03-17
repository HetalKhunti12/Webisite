class SessionsController < Devise::SessionsController
	layout "homepage"
	def new
		@package = "Sign In"
		super
	end

	def create
		@contact = Contact.find_by_work_email(params[:contact][:work_email])
		if @contact and @contact.valid_password?(params[:contact][:encrypted_password])
  		sign_in(:contact, @contact)
  		redirect_to portal_dashboards_url
  	else
  		@contact = Contact.new
  		redirect_to request.referer, notice: "Username and Password Incorrect"
  	end
	end

	def destroy
		super
	end
end
