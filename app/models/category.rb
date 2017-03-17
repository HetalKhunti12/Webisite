class Category < ActiveRecord::Base
	has_attached_file :image, styles: { medium: "300x300>", thumb: "100x100>" }, default_url: "/images/:style/missing.png"
  validates_attachment_content_type :image, content_type: /\Aimage\/.*\z/

  validate :file_dimensions, :unless => "errors.any?"
  
  def file_dimensions
    if !image.blank?
      dimensions = Paperclip::Geometry.from_file(self.image.queued_for_write[:original].path)
      width = dimensions.width
      height = dimensions.height
      if dimensions.width < 220 && dimensions.height < 300
        errors.add(:image,'Width or height must be at least 220X300 px')
      end
    else
      errors.add(:image,'Upload Atleast One Image')
    end
  end


  CITYES = ["Melbourne","Brisbane","Perth","Sydney", "Adeliade"]
  EVENTS_TYPE = ["Anniversary Party","Baby Shower","Bachelor Party","Bachelorette Party", "Campus Event","Cultural Event", "Dinner Party","Festival","Grand Opening","House Party","Religious Celebration","Retirement Party","Wedding Ceremony","Wedding Engagement","Surprise"]
  NO_OF_PERSON = ["10","20","30","40","50","60","70","80","90","100","150","200"]
  START_TIME = ["12:00pm (Noon)","1:00pm","2:00pm","3:00pm","4:00pm","5:00pm","6:00pm","7:00pm","8:00pm","9:00pm","10:00pm","11:00pm","12:00am (Midnight)","1:00am","2:00am","3:00am","4:00am","5:00am","6:00am","7:00am","8:00am","9:00am","10:00am","11:00am"]
  TOTAL_TIME = ["1 hour","1 hour 30 minutes","2 hours","2 hours 30 minutes","3 hours","3 hours 30 minutes","4 hours","4 hours 30 minutes","5 hours","5 hour 30 minutes","6 hours","6 hours 30 minutes","7 hours","7 hours 30 minutes","8 hours","8 hours 30 minutes","9 hours","9 hours 30 minutes","10 hours","10 hours 30 minutes","11 hours","11 hours 30 minutes","12 hours"]

  has_ancestry
  has_many :states
  has_many :artist_profiles

  extend FriendlyId
  friendly_id :id, use: :slugged

end
