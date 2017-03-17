class ProfileImage < ActiveRecord::Base
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

  belongs_to :artist_profile
end
