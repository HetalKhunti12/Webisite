class AvailabilitiesController < ApplicationController

	def create
    @artist_service_order = Available.new(available_params)
    #respond_to do |format|
      @artist_service_order.save
      render nothing: true
	end

	private

	def available_params
		params.require(:availability).permit!
	end
end
