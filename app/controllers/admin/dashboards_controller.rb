class Admin::DashboardsController < ApplicationController
    before_action :authenticate_contact!
	layout "admin"
	def index
    if current_contact.role.name != "admin"
      sign_out current_contact
      redirect_to admin_path
    else
  		@profile_series = []
      @enquiry_series = []
      @comm_series = []

      profil_ids = ArtistProfile.pluck(:id)
      @enquiries = Inquiry.all.limit(10)
     
      @enquiries_count = InquiryProfile.all.group_by { |m| m.created_at.beginning_of_month }

      @enquiries_count.each do |month, inquiry|
        @enquiry_series << { name: month.strftime("%B"), data: [inquiry.count]}
      end

      @bookings = Booking.all.limit(10)

      @bookings_count = Booking.all.group_by { |m| m.created_at.beginning_of_month }

      @bookings_count.each do |month, inquiry|
        @comm_series << { name: month.strftime("%B"), data: [inquiry.count]}
      end


      @profiles = ArtistProfile.all.limit(10)
      
      @profiles_count = ArtistProfile.all.group_by { |m| m.created_at.beginning_of_month }
     
      @profiles_count.each do |month, profile|
        @profile_series << { name: month.strftime("%B"), data: [profile.count] }
      end
    end
	end

	def update_profile
		@profile = ArtistProfile.find(params[:id])
		if @profile.present?
			@profile.update_attributes(approved: params[:status])
		end
		render nothing: true
	end
end
