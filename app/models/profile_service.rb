class ProfileService < ActiveRecord::Base
	belongs_to :inquiry_profile
	after_initialize do
    if self.new_record?
      # values will be available for new record forms.
      self.gross_commission_percent = 20 
    end
  end
  validates :start_date, :end_date, :presence => true
end
