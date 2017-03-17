class CreateTestimonials < ActiveRecord::Migration
  def change
    create_table :testimonials do |t|
      t.string :title
      t.text :description
      t.attachment :testimonial_image

      t.timestamps null: false
    end
  end
end
