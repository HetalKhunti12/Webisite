class HowItWork < ActiveRecord::Base
  has_attached_file :how_it_works_image, styles: { medium: "300x300>", thumb: "100x100>" }, default_url: "/images/:style/missing.png"
  validates_attachment_content_type :how_it_works_image, content_type: /\Aimage\/.*\z/
  has_attached_file :how_it_works_video
  do_not_validate_attachment_file_type(:how_it_works_video)
end
