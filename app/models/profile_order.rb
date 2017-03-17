class ProfileOrder < ActiveRecord::Base
	has_many :service_orders, dependent: :destroy
  accepts_nested_attributes_for :service_orders
  belongs_to :booking
  #ratyrate_rateable 'visual_effects', 'original_score', 'director', 'custome_design'
end
