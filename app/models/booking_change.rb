class BookingChange < ActiveRecord::Base
  serialize :contact_person_on_day, Array
  serialize :contact_mobile_on_day, Array
  belongs_to :booking
end
