class ServiceOrder < ActiveRecord::Base
	belongs_to :artist_profile
  validates :service_start, :presence => true
  serialize :contact_person_on_day, Array
  serialize :contact_mobile_on_day, Array
end
