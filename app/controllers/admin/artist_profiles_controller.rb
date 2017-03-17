class Admin::ArtistProfilesController < ApplicationController
  before_action :authenticate_contact!
	before_action :set_artist_profile, only: [:show, :edit, :update, :destroy]
  layout "admin"

  
	def index
    if params[:type].present? and params[:type] == "search" 
      @categories_header = Category.where("ancestry is null")
      where = ""
        where += "keywords = '#{params[:keywords]}'" if !params[:keywords].blank?
        cond = (!where.blank?) ? " AND " : ""
        where += " #{cond} category_id = '#{params[:category_id]}' OR sub_category_id = '#{params[:category_id]}' " if !params[:category_id].blank?
        cond = (!where.blank?) ? " AND " : ""
        where += " #{cond} approved = '#{params[:approved]}'" if !params[:approved].blank?
        cond = (!where.blank?) ? " AND " : ""
        where += " #{cond} price = '#{params[:price]}'" if !params[:price].blank?
        if where.present? 
          @artist_profiles = ArtistProfile.where(where).paginate(:page => params[:page], :per_page => 10)
        else
          redirect_to request.referer
        end
    else
		  @artist_profiles = ArtistProfile.search(params[:search]).paginate(:page => params[:page], :per_page => 20)
    end
  end

  def new
    @artist_profile = ArtistProfile.new
    @profile_images = @artist_profile.profile_images.build
    @artist_service_orders = @artist_profile.artist_service_orders.build
    @categories = Category.where("ancestry is null")
    
  end

  def create
    @artist_profile = ArtistProfile.new(artist_profile_params)

    respond_to do |format|
      if @artist_profile.save
        # if @artist_profile.published?
        #   UserMailer.profile_added(@artist_profile).deliver
        # end
        format.html { redirect_to admin_artist_profiles_url, notice: 'Artist Profile was successfully created.' }
        format.json { render :show, status: :created, location: @artist_profile }
      else
        #@profile_images = @artist_profile.profile_images.build
        @categories = Category.where("ancestry is null")
        format.html { render :new }
        format.json { render json: @artist_profile.errors, status: :unprocessable_entity }
      end
    end
  end


  def update
    respond_to do |format|
      if @artist_profile.update(artist_profile_params)
        format.html { redirect_to admin_artist_profiles_url, notice: 'Artist Profile was successfully updated.' }
        format.json { render :show, status: :ok, location: @artist_profile }
      else

        format.html { render :edit }
        format.json { render json: @artist_profile.errors, status: :unprocessable_entity }
      end
    end
  end

  def destroy
    @artist_profile.destroy
    respond_to do |format|
      format.html { redirect_to admin_artist_profiles_url, notice: 'Artist Profile was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  def artist_profile_details
    @categories_header = Category.where("ancestry is null")
    @artist_profile = ArtistProfile.find(params[:artist_profile_id])
    #impressionist(@artist_profile, "visited")
    @artist_service_order = ArtistServiceOrder.first 
    artist = @artist_service_order.new_artist_fee_cents
    a = ((100-20).to_f/100)
    @include_gst = artist/a
    @inquiry = Inquiry.new
    @inquiry_profile = @inquiry.inquiry_profiles.build
    @profile_service = @inquiry_profile.profile_services.build
    @venue_types = Booking.venue_types
    @salutations = Booking.salutations
    @event_types = Booking.event_types
    @birthdays = Booking.birthdays
  end


	private
    # Use callbacks to share common setup or constraints between actions.
    def set_artist_profile
      @artist_profile = ArtistProfile.find_by_slug(params[:id])
      @categories = Category.where("ancestry is null")
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def artist_profile_params
      params.require(:artist_profile).permit!
      # params.require(:profile_order).permit(:booking_id, :purchase_number, :profile_id, :p_name, :p_profile_type, :p_comission_percentage, :p_special_comments, :purchase_number, :artist_booking_form_sent, :artist_booking_form_confirmed, :artist_booking_form_returned, :artist_invoice_received, :artist_invoice_paid, :purchase_order_sent, service_orders_attributes:[:service_option_id, :profile_order_id, :description, :service_start, :service_duration, :so_title, :so_description, :so_price, :artist_fee])
    end
end
