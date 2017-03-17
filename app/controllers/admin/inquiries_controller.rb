class Admin::InquiriesController < ApplicationController
  before_action :authenticate_contact!
	before_action :set_inquiry, only: [:show, :edit, :update, :destroy]
	layout "admin"
	def index
    @inquiries = Inquiry.all.paginate(:page => params[:page], :per_page => 10)
  end

  def create
    @inquiry = Inquiry.new(inquiry_params)

    if @inquiry.save
      @contact = Contact.find_by_work_email(@inquiry.email)
      role_id = Role.find_by_name(params[:contact_type]).id
      
      UserMailer.send_inquiry_email(@inquiry).deliver
      if !@contact.present?
        @contact = Contact.create(company: @inquiry.client_company, first_name: @inquiry.client_name ,work_email: @inquiry.email, password: params[:password], password_confirmation: params[:password], work_city: @inquiry.client_city, address: @inquiry.address, work_phone: @inquiry.phone, mobile_phone: @inquiry.client_number, fax: @inquiry.fax, role_id: role_id, contact_type: params[:contact_type])
        token1, token = Devise.token_generator.generate(Contact, :confirmation_token)
        @contact.update_attributes(confirmation_token: token, confirmation_sent_at: Date.today)
        UserMailer.confirmation_instructions(@contact, token).deliver
       redirect_to admin_inquiries_path, notice: 'Inquiry was successfully created.' 
      end
    else
      render :new 
    end
  end

  def update
    respond_to do |format|
      if @inquiry.update(inquiry_params)
        if params[:email_form]
          @inquiry.update_attributes(approved: true)
          @inquiry.update_attributes(send_date: DateTime.now)
          UserMailer.register_customer(@inquiry).deliver_later
          format.html { redirect_to admin_inquiries_url, notice: 'Inquiry was successfully updated.' }
          format.json { render :show, status: :created, location: @inquiry }
        else
          format.html { redirect_to admin_inquiries_path, notice: 'Inquiry was successfully updated.' }
          format.json { render :show, status: :created, location: @inquiry }
        end
      else
        format.html { render :edit }
        format.json { render json: @inquiry.errors, status: :unprocessable_entity }
      end
    end
  end

  def destroy
    @inquiry.destroy
    respond_to do |format|
      format.html { redirect_to admin_inquiries_url, notice: 'Inquiry was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_inquiry
      @inquiry = Inquiry.find(params[:id])
      @venue_types = Booking.venue_types
      @salutations = Booking.salutations
      @event_types = Booking.event_types
      @birthdays = Booking.birthdays
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def inquiry_params
      params.require(:inquiry).permit!
    end

end
