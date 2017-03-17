class Testimonial < ActiveRecord::Base
  has_attached_file :testimonial_image, styles: { medium: "300x300>", thumb: "100x100>" }, default_url: "/images/:style/missing.png"
  validates_attachment_content_type :testimonial_image, content_type: /\Aimage\/.*\z/
end
