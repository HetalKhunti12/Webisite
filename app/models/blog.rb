class Blog < ActiveRecord::Base
  has_attached_file :blog_image, styles: { medium: "300x300>", thumb: "100x100>" }, default_url: "/images/:style/missing.png"
  validates_attachment_content_type :blog_image, content_type: /\Aimage\/.*\z/
  has_many :comments
end
