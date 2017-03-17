class InquiriesController < ApplicationController
  before_action :set_inquiry, only: [:show, :edit, :update, :destroy]

  def index
    @inquiries = current_contact.inquiry_profiles.paginate(:page => params[:page], :per_page => 10)
    @my_inquiries = Inquiry.where(email: current_contact.work_email).paginate(:page => params[:page], :per_page => 10)
  end

  def show
  end

  def new
    @artist_profile = ArtistProfile.find(params[:profile_id])
    @inquiry = Inquiry.new
  end

  def edit
    
  end

  def create
    @inquiry = Inquiry.new(inquiry_params)
    comm = 0
    if @inquiry.save

      @inquiry.inquiry_profiles.each do |ip|
        if ip.artist_service_order_id.present?
          ip.profile_services.each do |ps|
            artist = ps.artist_fee.present? ? ps.artist_fee : ip.artist_service_order.artist_fee 
            a = ((100-ps.gross_commission_percent).to_f/100)
            comm = artist/a
            ps.update_attributes(artist_fee_include_gst: comm.to_f)
          end
        end
      end
      @contact = Contact.find_by_work_email(@inquiry.email)
      role_id = Role.find_by_name(params[:contact_type]).id
      
      UserMailer.send_inquiry_email(@inquiry).deliver
      if @contact.present?
        if @contact.role.name == "artist"
          role_id = Role.find_by_name("both").id
          @contact.update_attributes(role_id: role_id)
        end
        sign_in(@contact, :bypass => true)
        redirect_to dashboards_path
      else
        @contact = Contact.create(company: @inquiry.client_company, first_name: @inquiry.client_name ,work_email: @inquiry.email, password: params[:password], password_confirmation: params[:password], work_city: @inquiry.client_city, address: @inquiry.address, work_phone: @inquiry.phone, mobile_phone: @inquiry.client_number, fax: @inquiry.fax, role_id: role_id, contact_type: params[:contact_type])
        token1, token = Devise.token_generator.generate(Contact, :confirmation_token)
        @contact.update_attributes(confirmation_token: token, confirmation_sent_at: Date.today)
        UserMailer.confirmation_instructions(@contact, token).deliver
       redirect_to root_path, notice: 'Inquiry was successfully created.' 
      end
    else
      render :new 
    end
  end

  def update

    respond_to do |format|
      if @inquiry.update(inquiry_params)
          @inquiry.inquiry_profiles.each do |ip|
            ip.profile_services.each do |ps|
              artist = ps.artist_fee
              a = ((100-ps.gross_commission_percent).to_f/100)
              comm = artist/a
              ps.update_attributes(artist_fee_include_gst: comm.to_f)
            end
          end
          if params[:approve]
            @inquiry.update_attributes(approved: true)

            UserMailer.send_change_inquiry_email(@inquiry).deliver_later
          end
          format.html { redirect_to inquiries_url, notice: 'Inquiry was successfully updated.' }
          format.json { render :show, status: :created, location: @inquiry }
      else
        format.html { render :edit }
        format.json { render json: @inquiry.errors, status: :unprocessable_entity }
      end
    end
  end

  def edit_inquiry
    @inquiry = Inquiry.find(params[:inquiry_id])
    @venue_types = Booking.venue_types
    @salutations = Booking.salutations
    @event_types = Booking.event_types
    @birthdays = Booking.birthdays
  end

  def update_inquiry
    @inquiry = Inquiry.find(params[:inquiry_id])
    respond_to do |format|
      if @inquiry.update(inquiry_params)
        if params[:approve]
          @inquiry.update_attributes(approved: true)
          @inquiry.update_attributes(send_date: DateTime.now)
          UserMailer.register_customer(@inquiry).deliver_later
        end
        format.html { redirect_to inquiries_url, notice: 'Inquiry was successfully updated.' }
        format.json { render :show, status: :created, location: @inquiry }
      else
        format.html { render :edit }
        format.json { render json: @inquiry.errors, status: :unprocessable_entity }
      end
    end
  end

  def approved
    @inquiry = Inquiry.find(params[:id])
    if @inquiry.present?
      @inquiry.update_attributes(approved: params[:status])
    end
    if @inquiry.approved 
      @inquiry.update_attributes(send_date: DateTime.now)
      UserMailer.register_customer(@inquiry).deliver_later
    end
    render nothing: true
  end


  # DELETE /inquiries/1
  # DELETE /inquiries/1.json
  def destroy
    @inquiry.destroy
    respond_to do |format|
      format.html { redirect_to inquiries_url, notice: 'Inquiry was successfully destroyed.' }
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
