class Review < ActiveRecord::Base
	belongs_to :artist_profile
  belongs_to :contact
end
