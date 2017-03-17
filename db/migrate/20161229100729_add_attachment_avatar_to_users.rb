class AddAttachmentAvatarToUsers < ActiveRecord::Migration
  def self.up
    change_table :listings do |t|
      t.attachment :image
    end
    
    change_table :categories do |t|
      t.attachment :image
    end
  end

  def self.down
    remove_attachment :listings, :image
    remove_attachment :categories, :image
  end
end
