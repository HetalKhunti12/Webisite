class ArtistProfilesController < ApplicationController
	before_action :set_artist_profile, only: [:show, :edit, :update, :destroy]
  before_action :authenticate_contact!, except: [:artist_profile_details, :download, :top_artist_profiles]
  impressionist :actions=>[:show]

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
          @artist_profiles = current_contact.artist_profiles.where(where).paginate(:page => params[:page], :per_page => 10)
        else
          redirect_to request.referer
        end
    else
      @artist_profiles = current_contact.artist_profiles.paginate(:page => params[:page], :per_page => 10)
    end
  end

  def show
  end

  def new
    @artist_profile = ArtistProfile.new
    @profile_images = @artist_profile.profile_images.build
    @artist_service_orders = @artist_profile.artist_service_orders.build
    @categories = Category.where("ancestry is null")
  end

  def edit
  end

  def create
    @artist_profile = ArtistProfile.new(artist_profile_params)

    respond_to do |format|
      if @artist_profile.save
        if @artist_profile.published?
          UserMailer.profile_added(@artist_profile).deliver
        end
        format.html { redirect_to artist_profiles_url, notice: 'Artist Profile was successfully created.' }
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
        format.html { redirect_to artist_profiles_url, notice: 'Artist Profile was successfully updated.' }
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
      format.html { redirect_to artist_profiles_url, notice: 'Artist Profile was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  def artist_profile_details
    @categories_header = Category.where("ancestry is null")
    @artist_profile = ArtistProfile.find_by_slug(params[:id])
    impressionist(@artist_profile, "visited")
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

  
  def download
    client = ProfileContent.find(params[:id])
    send_data client.certificate.path,
              filename: "#{client.certificate.original_filename}.pdf",
              type: "#{client.certificate_content_type}",
              dispostion: 'attachment'
  end

  def top_artist_profiles

    if params[:location].present? and params[:keywords].present?
      @category_artist_profiles = ArtistProfile.approved.search_by_artist_title_and_keyword_and_body(params[:keywords]).where("location2 =?", params[:location])
    elsif params[:country].present? and params[:keywords].present? 
      @category_artist_profiles = ArtistProfile.approved.search_by_artist_title_and_keyword_and_body(params[:keywords]).where("country NOT IN (?) or location2 NOT IN (?)", "AU", Category::CITYES)
    elsif params[:country].present?
      @category_artist_profiles = ArtistProfile.approved.where("country NOT IN (?) or location2 NOT IN (?)", "AU", Category::CITYES)
    elsif params[:location].present?
      @category_artist_profiles = ArtistProfile.approved.where("location2 =?", params[:location])
    elsif params[:keywords].present?
      @category_artist_profiles = ArtistProfile.approved.search_by_artist_title_and_keyword_and_body(params[:keywords])
    else 
       @category_artist_profiles = ArtistProfile.approved.order('created_at desc')
    end
  end


  private
    def set_artist_profile
      @categories = Category.where("ancestry is null")
      @artist_profile = ArtistProfile.find_by_slug(params[:id])
    end

    def artist_profile_params
      params.require(:artist_profile).permit!
    end
end
