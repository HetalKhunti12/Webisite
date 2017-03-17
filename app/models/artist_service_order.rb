class ArtistServiceOrder < ActiveRecord::Base

	belongs_to :artist_profile
	has_many :inquiry_profiles
  validates_presence_of :service_start, :service_end, :so_summary, :new_artist_fee_cents, presence: true , on: :create

	def as_json(options = {})
    {
      :id => self.id,
      :title => self.so_summary,
      :start => self.service_start,
      :end => self.service_end,
     }
  end
end
