class ArtistServiceOrdersController < ApplicationController
	before_action :authenticate_contact!
	def index
		@artist_service_orders = ArtistServiceOrder.where("artist_profile_id IN (?)",current_contact.artist_profiles.pluck(:id))

		respond_to do |format|
	    format.html # index.html.erb
	    format.json { render :json => @artist_service_orders }
	  end
		
	end

	def new
		@artist_service_order = ArtistServiceOrder.new
		respond_to do |format|
	    format.html # index.html.erb
	    #format.js
	  end
	end

	def edit
		@artist_service_order = ArtistServiceOrder.find(params[:id])
	end

	def create
		@artist_service_order = ArtistServiceOrder.new(artist_service_order_params)

    respond_to do |format|
      if @artist_service_order.save
        format.html { redirect_to artist_service_orders_url, notice: 'Service order was successfully created.' }
        format.json { render :show, status: :created, location: @@artist_service_order }
      else
        format.html { render :new }
        format.json { render json: @artist_service_order.errors, status: :unprocessable_entity }
      end
   	end
  end

  def update
   	@artist_service_order = ArtistServiceOrder.find(params[:id])
    
    respond_to do |format|
      if @artist_service_order.update_attributes(artist_service_order_params)
        format.html { redirect_to artist_service_orders_url, notice: 'Service order was successfully created.' }
        format.json { render :show, status: :created, location: @@artist_service_order }
      else
        format.html { render :new }
        format.json { render json: @artist_service_order.errors, status: :unprocessable_entity }
      end
   	end
	end

	private

	def artist_service_order_params
		params.require(:artist_service_order).permit!
	end
end
