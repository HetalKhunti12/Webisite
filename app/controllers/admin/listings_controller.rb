class Admin::ListingsController < ApplicationController
	before_action :authenticate_contact!
	layout "admin"
	
	def index
		@listings = Listing.all.paginate(:page => params[:page], :per_page => 7)
	end
	def new
		@listing = Listing.new
	end
end
