class PasswordsController < Devise::PasswordsController
	def new
		@contact = Contact.new
	end

	def create
		@contact = Contact.find_by_work_email(params[:contact][:work_email])
		if @contact.present?
			token1, token = Devise.token_generator.generate(Contact, :reset_password_token)
			@contact.update_attributes(reset_password_token: token, reset_password_sent_at: Date.today)
			UserMailer.send_reset_password_instructions(@contact, token).deliver
			redirect_to request.referer
		else
			redirect_to request.referer
		end
	end

	def edit
		super
	end

	def update
		@user = Contact.find_by_reset_password_token(params[:contact][:reset_password_token])
		if @user
			@user.update_attributes(account_update_params)
			sign_in(@user, :bypass => true)
      redirect_to dashboards_path, notice: "Your password has been changed successfully. You are now signed in. "
		else
			redirect_to request.referer, alert: "Authentication faile!"
		end
	end

	private
	def account_update_params
    params.require(:contact).permit(:password, :password_confirmation)
  end
end
