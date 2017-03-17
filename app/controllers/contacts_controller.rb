class ContactsController < ApplicationController
   require "active_merchant/billing/rails"
  def new
    @contact = Contact.new
  end

  def create
  end

  def register
  end

  def payment_section
    @package = Package.find(session[:package_id])
    @contact_payment = ContactPayment.new
    @contact_payment.build_card
  end

  def save_contact
    @contact_payment = ContactPayment.new(contact_payment_params)
    @contact_payment.card.ip_address = request.remote_ip
    if @contact_payment.save
      # if params[:contact_payment][:payment_type] == "paypall"
        if @contact_payment.card.purchase
          @contact = Contact.create(company: session[:company], first_name: session[:first_name],work_email: session[:work_email], password: session[:password], password_confirmation: session[:password_confirmation], work_country: session[:work_country], work_state: session[:work_state], work_city: session[:work_city], address: session[:address], work_postcode: session[:work_postcode], work_phone: session[:work_postcode], mobile_phone: session[:mobile_phone], website: session[:website], abn: session[:abn], fax: session[:fax], email_format: session[:email_format], package_id: session[:package_id], role_id: 6, contact_type: session[:contact_type])
            session.delete(:company)
            session.delete(:first_name)
            session.delete(:password)
            session.delete(:password_confirmation) 
            session.delete(:work_country)
            session.delete(:work_city)
            session.delete(:work_phone)
            session.delete(:work_email)
            session.delete(:fax) 
            session.delete(:mobile_phone) 
            session.delete(:website)
            session.delete(:abn)
            session.delete(:package_id)
            session.delete(:address)
            session.delete(:email_format)
            session.delete(:package_id)
            session.delete(:contact_type)
            
            token1, token = Devise.token_generator.generate(Contact, :confirmation_token)
            @contact.update_attributes(confirmation_token: token, confirmation_sent_at: Date.today)
            @contact_payment.update_attributes(contact_id: @contact.id, payment_date: Date.today )
            
            UserMailer.confirmation_instructions(@contact, token).deliver
            UserMailer.admin_mailer(@contact).deliver
            redirect_to root_url
        else
          redirect_to request.referer, alert: @contact_payment.card.card_transaction.message
        end
      
      # else 
      # begin
      #   if @contact_payment.card.purchase_new
      #     role_id = Role.find_by_name(session[:contact_type]).id
      #     @contact = Contact.create(company: session[:company], first_name: session[:first_name],work_email: session[:work_email], password: session[:password], password_confirmation: session[:password_confirmation], work_country: session[:work_country], work_state: session[:work_state], work_city: session[:work_city], address: session[:address], work_postcode: session[:work_postcode], work_phone: session[:work_postcode], mobile_phone: session[:mobile_phone], website: session[:website], abn: session[:abn], fax: session[:fax], email_format: session[:email_format], package_id: session[:package_id], role_id: role_id, contact_type: session[:contact_type])
      #     session.delete(:company)
      #     session.delete(:first_name)
      #     session.delete(:password)
      #     session.delete(:password_confirmation) 
      #     session.delete(:work_country)
      #     session.delete(:work_city)
      #     session.delete(:work_phone)
      #     session.delete(:work_email)
      #     session.delete(:fax) 
      #     session.delete(:mobile_phone) 
      #     session.delete(:website)
      #     session.delete(:abn)
      #     session.delete(:package_id)
      #     session.delete(:address)
      #     session.delete(:email_format)
      #     session.delete(:contact_type)
          
      #     token1, token = Devise.token_generator.generate(Contact, :confirmation_token)
      #     @contact.update_attributes(confirmation_token: token, confirmation_sent_at: Date.today)
      #     @contact_payment.update_attributes(contact_id: @contact.id, payment_date: Date.today )
          
      #     UserMailer.confirmation_instructions(@contact, token).deliver
      #     UserMailer.admin_mailer(@contact).deliver
      #     redirect_to root_url
      #   else
      #     redirect_to request.referer, alert: @contact_payment.card.card_transaction.message
      #   end
      # rescue Exception => e
      #   flash[:alert] = "#{e.message}."
      #   redirect_to request.referer
      # end
      # end
    else
      @package = Package.find(session[:package_id])
      render :payment_section
    end
  end

  def webhook_events
    abort params.inspect
  end

  def states
    @states = CS.states(params[:country_id])
    @states = @states.map do |region|
      [region[1], region[0]]
    end
  
    respond_to do |format|
      format.js
    end
    return false
  end

  def cities
    @cities = CS.cities(params[:state_id])
    respond_to do |format|
      format.js
    end
    return false
  end

  def edit_states
    @id = params[:state_id]
    @country = Country.find(params[:country_id])
    @states = State.where(country_id: @country.id)
    @states = @states.select('id, name').map do |region|
      [region.name, region.id]
    end
  
    respond_to do |format|
      format.js
    end
    return false
  end

  def sub_category
    @category = Category.find(params[:cat_id])
    @categories = @category.subtree
    @categories = @categories.select('id, name').map do |region|
      [region.name, region.id]
    end
  
    respond_to do |format|
      format.js
    end
    return false
  end

  def edit_sub_category
    @id = params[:sub_category]
    @category = Category.find(params[:cat_id])
    @categories = @category.subtree
    @categories = @categories.select('id, name').map do |region|
      [region.name, region.id]
    end
  
    respond_to do |format|
      format.js
    end
    return false
  end

  def confirmation
    @contact = Contact.find_by_confirmation_token(params[:token])
    if @contact.present?
      @contact.update_attributes(confirmed_at: Date.today)
      redirect_to new_contact_session_path, notice: "Email Confirmed"
    else
      redirect_to root_url
    end
    
  end


  private

 
  def card_params
    card_params = params[:contact_payment][:card]
    
  end

  def contact_params
     params.require(:contact).permit!
  end

  def contact_payment_params
     params.require(:contact_payment).permit!
  end
  
end
