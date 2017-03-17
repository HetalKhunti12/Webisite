json.extract! profile_image, :id, :image, :title, :description, :artist_profile_id, :created_at, :updated_at
json.url profile_image_url(profile_image, format: :json)