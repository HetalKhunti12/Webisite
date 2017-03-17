class ProfileVideo < ActiveRecord::Base
	belongs_to :artist_profile
	has_attached_file :video
  do_not_validate_attachment_file_type(:video)

end
