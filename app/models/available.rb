class Available < ActiveRecord::Base
  belongs_to :artist_profiles
  belongs_to :contact
end
