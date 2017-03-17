class InquiryProfile < ActiveRecord::Base
	belongs_to :contact
	belongs_to :artist_service_order
  belongs_to :inquiry
  
  has_many :profile_services
  accepts_nested_attributes_for :profile_services, reject_if: :all_blank
end
