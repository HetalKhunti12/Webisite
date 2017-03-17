class AddAttachmentAudioToListings < ActiveRecord::Migration
  def self.up
    change_table :listings do |t|
      t.attachment :audio
    end
  end

  def self.down
    remove_attachment :listings, :audio
  end
end
