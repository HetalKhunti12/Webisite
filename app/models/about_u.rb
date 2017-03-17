class AboutU < ActiveRecord::Base
  has_attached_file :about_us_image, styles: { medium: "300x300>", thumb: "100x100>" }, default_url: "/images/:style/missing.png"
  validates_attachment_content_type :about_us_image, content_type: /\Aimage\/.*\z/
  has_attached_file :about_us_video
  do_not_validate_attachment_file_type(:about_us_video)
end
