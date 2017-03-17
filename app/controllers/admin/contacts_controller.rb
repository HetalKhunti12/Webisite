class Admin::ContactsController < ApplicationController
	layout "admin"
	def new
		if current_contact.present?
			redirect_to admin_dashboards_url
		else
			@contact = Contact.new
		end
	end

	def new_contact
		@contact = Contact.new
		@contact_payment = @contact.contact_payments.build
		@card = @contact_payment.build_card
	end

	def create

		@contact = Contact.find_by_work_email(params[:contact][:work_email])
		if @contact and @contact.valid_password?(params[:contact][:encrypted_password]) and @contact.role.name == "admin"
  		sign_in(:contact, @contact)
  		redirect_to admin_dashboards_url
  	else
  		@contact = Contact.new
  		render :new
  	end
	end

	def save_contact
		@contact = Contact.new(contact_params)
		if @contact.valid?
			params.permit!
			@package = Package.find(params[:contact][:package_id])
			contact_type = Role.find(params[:contact][:role_id]).name
			@contact_payment = ContactPayment.new(params[:contact][:contact_payment])
	    @contact_payment.card.ip_address = request.remote_ip
	    if @contact_payment.save
	    	@contact_payment.update_attributes(amount: @package.price)
	      if params[:contact][:contact_payment][:payment_type] == "pay_pall"
	      	#begin
	          if @contact_payment.card.purchase
	          	@contact = Contact.create(company: params[:contact][:company], first_name: params[:contact][:first_name],work_email: params[:contact][:work_email], password: params[:contact][:password], password_confirmation: params[:contact][:password_confirmation], work_country: params[:contact][:work_country], work_state: params[:contact][:work_state], work_city: params[:contact][:work_city], address: params[:contact][:address], work_postcode: params[:contact][:work_postcode], work_phone: params[:contact][:work_postcode], mobile_phone: params[:contact][:mobile_phone], website: params[:contact][:website], abn: params[:contact][:abn], fax: params[:contact][:fax], email_format: params[:contact][:email_format], package_id: params[:contact][:package_id], role_id: params[:contact][:role_id], contact_type: contact_type)
	          	@contact.update_attributes(confirmed_at: Date.today)
	            @contact_payment.update_attributes(contact_id: @contact.id, payment_date: Date.today )
	            #UserMailer.welcome_mailer(@contact).deliver
	            redirect_to admin_contacts_path
	          else
	            redirect_to request.referer, alert: @contact_payment.card.card_transaction.message
	          end
	        # rescue Exception => e
	        #   flash[:alert] = "#{e.message}."
	        #   redirect_to request.referer
	        # end
	      else
	      	if @contact_payment.card.purchase_new
	      		@contact = Contact.create(company: params[:contact][:company], first_name: params[:contact][:first_name],work_email: params[:contact][:work_email], password: params[:contact][:password], password_confirmation: params[:contact][:password_confirmation], work_country: params[:contact][:work_country], work_state: params[:contact][:work_state], work_city: params[:contact][:work_city], address: params[:contact][:address], work_postcode: params[:contact][:work_postcode], work_phone: params[:contact][:work_postcode], mobile_phone: params[:contact][:mobile_phone], website: params[:contact][:website], abn: params[:contact][:abn], fax: params[:contact][:fax], email_format: params[:contact][:email_format], package_id: params[:contact][:package_id], role_id: params[:contact][:role_id], contact_type: contact_type)

	      		@contact.update_attributes(confirmed_at: Date.today)
	          @contact_payment.update_attributes(contact_id: @contact.id, payment_date: Date.today )
	          redirect_to admin_contacts_path
	      	else
	          redirect_to request.referer, alert: @contact_payment.card.card_transaction.message
	      	end
	      end
	    else
	    	@contact = Contact.new
	    	render :new_contact
	    end
	  else
     	@contact_payment = @contact.contact_payments.build
			 @contact_payment.build_card
    	render :new_contact
    end
  end

	def index
		@contacts = Contact.all.paginate(:per_page => 20, :page => params[:page])
	end

	def sign_out
		reset_session
		redirect_to admin_path
	end

	private

	def contact_params
    params.require(:contact).permit(:password, :password_confirmation, :first_name, :address, :company, :mobile_phone, :work_phone, :work_postcode, :work_city, :work_country, :work_state, :email_format, :fax, :website, :abn,:work_email)
  end

	def contact_payment_params
		params.require(:contact).permit(:contact_payments)
	end

end
