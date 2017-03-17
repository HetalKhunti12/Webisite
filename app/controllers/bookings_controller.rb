class BookingsController < ApplicationController
  
  def index
      @orders = Booking.where("customer_email =?", current_contact.work_email)
      @venue_types = Booking.venue_types
  end

  def edit
    
    @booking = Booking.find(params[:id])
    @booking_change = BookingChange.new
    @booking_change = @booking.booking_change if @booking.booking_change.present?
    @venue_types = Booking.venue_types
    @event_types = Booking.event_types
  end

  def create
    contact_person_on_day = params[:booking_change][:contact_person_on_day].tr('[]', '').split(',')
    contact_mobile_on_day = params[:booking_change][:contact_mobile_on_day].tr('[]', '').split(',')

    @booking_change = BookingChange.new(booking_params)
    profileorder = ProfileOrder.find(booking_params[:profile_order_id])
    @email = profileorder.p_email
    @name = profileorder.p_name
    @booking = Booking.find(booking_params[:booking_id])

    # @first_name = booking.customer_firstname
    # @lastname = booking.customer_surname
    respond_to do |format|
      if @booking_change.save
        @booking_change.update_attributes(contact_person_on_day: contact_person_on_day, contact_mobile_on_day: contact_mobile_on_day)
        if @email.present?
          UserMailer.booking_change(@email, @booking_change.id, @name, @booking).deliver
        end
        format.html { redirect_to bookings_url, notice: 'Booking was successfully changed.' }
      else
        format.html { render :edit }
      end
    end
  end

  def document
    @documents = ArtistProfile.find(params[:id]).profile_contents
  end

  def show
   @profileorder = ProfileOrder.find(params[:id])
   @artist_profile = ArtistProfile.first
   @contact = Contact.find_by_work_email(@profileorder.p_email) 
   @reviews = @contact.reviews
  end

  def booking_change
    if current_contact
      @service_order = BookingChange.find(params[:id])
      @serviceord = ServiceOrder.find(@service_order.service_order_id)
    else
      redirect_to root_path, notice: 'Unothorized to accesss'
    end
  end

  def booking_change_status
    booking_change = BookingChange.find(params[:id])
    booking = Booking.find(booking_change.booking_id)
    @first_name = booking.customer_firstname
    @lastname = booking.customer_surname
    @customer_email = booking.customer_email
    profileor = ProfileOrder.find(booking_change.profile_order_id)
    @name = profileor.p_name
    
    if params[:status] == "true"
      @service_order = ServiceOrder.find(booking_change.service_order_id)
      @service_order.update_attributes(service_start: booking_change.service_start, service_end: booking_change.service_end, event_type: booking_change.event_type, venue_type: booking_change.venue_type, number_of_guests: booking_change.number_of_guests, contact_person_on_day: booking_change.contact_person_on_day, contact_mobile_on_day: booking_change.contact_mobile_on_day, venue_name: booking_change.venue_name, venue_address: booking_change.venue_address, venue_notes: booking_change.venue_notes)
      if @customer_email.present?
        UserMailer.booking_change_status(@customer_email,@first_name,@last_name, params[:status], @name ).deliver
      end
    else
      if @customer_email.present?
        UserMailer.booking_change_status(@customer_email,@first_name,@last_name, params[:status], @name ).deliver
      end
    end
    redirect_to root_path
  end

  private

  def booking_params
    params.require(:booking_change).permit(:service_start,:service_end,:event_type,:venue_type,:number_of_guests,:venue_type,:venue_name,:venue_address,:venue_notes,:booking_id,:profile_order_id,:service_order_id,contact_person_on_day:[],contact_mobile_on_day:[])
    end

end
