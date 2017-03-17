class RegistrationsController < Devise::RegistrationsController

  def new
    session[:contact_type] = params[:contact_type] 
    session[:package_id] = params[:package_id]
    @package = "Customer Details"
    @contact = Contact.new
  end

	def create
		@contact = Contact.new(contact_params)
    if @contact.valid?  
      if session[:package_id].to_i == 1
        role_id = Role.find_by_name(session[:contact_type]).id
        @contact.save
        token1, token = Devise.token_generator.generate(Contact, :confirmation_token)
        @contact.update_attributes(confirmation_token: token, confirmation_sent_at: Date.today, package_id: session[:package_id], role_id: role_id)
        UserMailer.confirmation_instructions(@contact, token).deliver
        UserMailer.admin_mailer(@contact).deliver
        session.delete(:package_id)
        session.delete(:contact_type)
        redirect_to root_url
      else
        session[:company] = contact_params[:company]
        session[:first_name] = contact_params[:first_name]
        session[:password] = contact_params[:password]
        session[:password_confirmation] = contact_params[:password_confirmation]
        session[:work_country] = contact_params[:work_country]
        session[:work_state] = contact_params[:work_state]
        session[:work_city] = contact_params[:work_city]
        session[:work_postcode] = contact_params[:work_postcode]
        session[:work_phone] = contact_params[:work_phone]
        session[:work_email] = contact_params[:work_email]
        session[:fax] = contact_params[:fax]
        session[:mobile_phone] = contact_params[:mobile_phone]
        session[:website] = contact_params[:website]
        session[:abn] = contact_params[:abn]
        session[:address] = contact_params[:address]
        session[:email_format] = contact_params[:email_format]
        redirect_to payment_section_path
      end
    else
      @package = "Customer Details"
      render :new
    end
	end

  def update
    if current_contact.update_attributes(contact_params)
      sign_in(current_contact, :bypass => true)
      redirect_to request.referer
    else
      render :edit
    end
    
  end

	private

	def contact_params
     params.require(:contact).permit(:password, :password_confirmation, :first_name, :address, :company, :mobile_phone, :work_phone, :work_postcode, :work_city, :work_country, :work_state, :email_format, :fax, :website, :abn,:work_email)
  end
end
