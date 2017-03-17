json.extract! admin_social_media_link, :id, :name, :link, :created_at, :updated_at
json.url admin_social_media_link_url(admin_social_media_link, format: :json)