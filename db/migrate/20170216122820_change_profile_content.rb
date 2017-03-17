class ChangeProfileContent < ActiveRecord::Migration
  def change
  	remove_attachment :profile_contents, :image   
  	remove_attachment :profile_contents, :audio
  	remove_column :profile_contents, :video
  	add_column :profile_contents, :title, :string
  	add_attachment :profile_contents, :certificate   
  end
end
