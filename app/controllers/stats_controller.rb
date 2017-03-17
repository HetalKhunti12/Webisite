class StatsController < ApplicationController

	def index
		@artist_profiles = ArtistProfile.all
		@series_data = []
		@series_name = []
		@series_com = []
		@artist_profiles.each do |ap|
			@series_name << ap.p_name
			#@series_com << ap.p_comission_percentage.to_i
    	@series_data << { name: ap.p_name, data: [ap.p_comission_percentage.to_i] } 
    end 
	end
end
