class Booking < ActiveRecord::Base
  include MyEnums
	has_many :artist_profile
  has_many :profile_orders
  has_one :booking_change

  accepts_nested_attributes_for :profile_orders

  
	#ratyrate_rater
  def staff_initials
    if !staff_responsible_id.nil? && staff_responsible_id>0 
      if staff_responsible_id == 3 
        "P"
      elsif staff_responsible_id == 4
        "L"
      elsif staff_responsible_id == 5
        "T"
      end
    else 
      '-'
    end
  end
end
