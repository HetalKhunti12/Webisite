class DashboardsController < ApplicationController
	before_action :authenticate_contact!
	layout "homepage"
  
  def index
    if current_contact.role.name == "admin"
      sign_out current_contact
      redirect_to new_contact_session_path, notice: "You Need To Login Before"
    else
    
      @profile_series = []
      @enquiry_series = []
      @comm_series = []

      profil_ids = current_contact.artist_profiles.pluck(:id)
      @enquiries = Inquiry.joins(:inquiry_profiles).where(:inquiry_profiles => {contact_id: current_contact.id}).limit(10)
     
      @enquiries_count = current_contact.inquiry_profiles.group_by { |m| m.created_at.beginning_of_month }

      @enquiries_count.each do |month, inquiry|
        @enquiry_series << { name: month.strftime("%B"), data: [inquiry.count]}
      end

      @bookings = Booking.joins(:profile_orders).where(:profile_orders => {p_email: current_contact.work_email}).limit(10)

      @bookings_count = Booking.joins(:profile_orders).where(:profile_orders => {p_email: current_contact.work_email}).group_by { |m| m.created_at.beginning_of_month }

      @bookings_count.each do |month, inquiry|
        @comm_series << { name: month.strftime("%B"), data: [inquiry.count]}
      end


      @profiles = current_contact.artist_profiles.all.limit(10)

      @profiles_count = current_contact.artist_profiles.group_by { |m| m.created_at.beginning_of_month }
     
      @profiles_count.each do |month, profile|
        @profile_series << { name: month.strftime("%B"), data: [profile.count] }
      end
    end
  end

  def portal
    if current_contact.role.name == "admin"
      sign_out current_contact
      redirect_to new_contact_session_path, notice: "You Need To Login Before"
    end    
  end

  def get_events
    @task = Available.all
    events = []
    @task.each do |task|
      events << {:id => task.id, :title => "#{task.title}", :start => "#{task.start_at.localtime}",:end => "#{task.end_at.localtime}", :allDay => "#{task.allDay}", :backgroundColor =>	 '#378006' }
    end

    # @bookings = Booking.joins(:profile_orders).where(:profile_orders => {p_email: current_contact.work_email}).limit(10)
    # @bookings.profile_orders.each do |po|
    #   po
    # end

    render :text => events.to_json
  end

end
