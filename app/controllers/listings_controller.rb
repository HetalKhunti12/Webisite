class ListingsController < ApplicationController
  before_action :authenticate_contact!
  before_action :set_listing, only: [:show, :edit, :update, :destroy]

  def index
    @package = "Listings"
    @listings = Listing.paginate(:page => params[:page], :per_page => 7)
  end

  def show
  end

  def new
    @listing = Listing.new
   # @contact.listings.build
  end

  def edit
  end

  def create
    @listing = Listing.new(listing_params)

    respond_to do |format|
      if @listing.save
        format.html { redirect_to @listing, notice: 'Listing was successfully created.' }
        format.json { render :show, status: :created, location: @listing }
      else
        format.html { render :new }
        format.json { render json: @listing.errors, status: :unprocessable_entity }
      end
    end
  end

  def update
    respond_to do |format|
      if @listing.update(listing_params)
        format.html { redirect_to @listing, notice: 'Listing was successfully updated.' }
        format.json { render :show, status: :ok, location: @listing }
      else
        format.html { render :edit }
        format.json { render json: @listing.errors, status: :unprocessable_entity }
      end
    end
  end

  def destroy
    @listing.destroy
    respond_to do |format|
      format.html { redirect_to listings_url, notice: 'Listing was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private

    def set_listing
      @listing = Listing.find(params[:id])
    end

    def listing_params
      params.require(:listing).permit(:objectTitle, :objectLocation1, :objectLocation2, :objectCountry, :objectPrimaryCategoryID, :objectRootCategoryId, :objectDescription1, :objectDescription2, :objectKeywords, :objectPricing, :objectEnabled, :dateLevelExpires, :objectTypeID, :objectStatus, :objectApproved, :objectApproved, :cotact_id)
    end

end
