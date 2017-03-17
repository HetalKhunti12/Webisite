json.extract! profile_video, :id, :video, :title, :description, :artist_profilr_id, :created_at, :updated_at
json.url profile_video_url(profile_video, format: :json)