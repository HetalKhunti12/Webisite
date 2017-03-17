class AddCommenttoInquiry < ActiveRecord::Migration
  def change
  	add_column :inquiries, :client_comment, :text
  	add_column :inquiries, :artist_comment, :text
  end
end
