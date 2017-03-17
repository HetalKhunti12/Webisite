class AddcolumnToProfileVideo < ActiveRecord::Migration
  def change
  	rename_column :profile_videos, :video, :video_url
  	change_column :profile_videos, :video_url, :string
  	add_attachment :profile_videos, :video
  end
end
