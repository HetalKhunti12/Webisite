class ContactPayment < ActiveRecord::Base
	has_one :card
  accepts_nested_attributes_for :card
  belongs_to :contact
  # validates_presence_of :payment_type, presence: true
end
