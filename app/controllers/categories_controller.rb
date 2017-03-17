class CategoriesController < ApplicationController
  before_action :set_category, only: [:show, :edit, :update, :destroy]
  # add_breadcrumb "category", :categories_path
  
  def index
    @categories = Category.where("ancestry is not null").order("RANDOM()")
  end

  
  def show
    @categories = Category.where("ancestry =? ",params[:id])
    @category = Category.find(params[:id])
    @categories_header = Category.where("ancestry is null")
    @banner = Banner.find_by_category_id(@category.id)
  end

  def new
    @category = Category.new
  end

  def edit
  end

  def create
    @category = Category.new(category_params)

    respond_to do |format|
      if @category.save
        format.html { redirect_to @category, notice: 'Category was successfully created.' }
        format.json { render :show, status: :created, location: @category }
      else
        format.html { render :new }
        format.json { render json: @category.errors, status: :unprocessable_entity }
      end
    end
  end

  def update
    respond_to do |format|
      if @category.update(category_params)
        format.html { redirect_to @category, notice: 'Category was successfully updated.' }
        format.json { render :show, status: :ok, location: @category }
      else
        format.html { render :edit }
        format.json { render json: @category.errors, status: :unprocessable_entity }
      end
    end
  end

  
  def destroy
    @category.destroy
    respond_to do |format|
      format.html { redirect_to categories_url, notice: 'Category was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  def category_artist_profiles
    if params[:keywords].present?
      @category_artist_profiles = ArtistProfile.approved.search_by_artist_title_keyword_body(params[:keywords], params[:sub_category_id], params[:location2])
    elsif params[:location].present?
       @category_artist_profiles = ArtistProfile.approved.where("location2 =? and sub_category_id =? ", params[:location], params[:id])
    elsif params[:country].present?
      @category_artist_profiles = ArtistProfile.approved.where("sub_category_id =? and (country NOT IN (?) or location2 NOT IN (?))", params[:id], "AU", Category::CITYES)
    else
      @category_artist_profiles = ArtistProfile.approved.where("sub_category_id =?",  params[:id])
    end
  end

  def artist_profile_inquiry
    @categories_header = Category.where("ancestry is null")
    @artist_profile = ArtistProfile.find_by_slug(params[:id])
    @artist_type = "other"
    if @artist_profile.p_profile_type == 1
      @artist_type = "band"
    elsif @artist_profile.p_profile_type == 2
      @artist_type = "entertainer"
    end
    @artist_service_order = ArtistServiceOrder.find(params[:service_order_id]) 
    # artist = @artist_service_order.new_artist_fee_cents
    # a = ((100-20).to_f/100)
    # @include_gst = artist/a
    @inquiry = Inquiry.new
    @inquiry_profile = @inquiry.inquiry_profiles.build
    @profile_service = @inquiry_profile.profile_services.build
    @venue_types = Booking.venue_types
    @salutations = Booking.salutations
    @event_types = Booking.event_types
    @birthdays = Booking.birthdays

  end

  private
    def set_category
      @category = Category.friendly.find(params[:id])
    end

    def category_params
      params.require(:category).permit(:name, :description, :url_path, :image, :ancestory)
    end
end