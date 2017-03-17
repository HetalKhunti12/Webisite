class ProfileContent < ActiveRecord::Base
  belongs_to :artist_profile
  
	has_attached_file :certificate, styles: { medium: "300x300>", thumb: "100x100>" }, default_url: "/images/:style/missing.png"
  validates_attachment_content_type :certificate, content_type: %w(application/pdf application/zip application/msword image/png image/jpeg image/jpg image/gif application/doc application/docx)

end
