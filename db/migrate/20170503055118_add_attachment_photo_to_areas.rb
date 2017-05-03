class AddAttachmentPhotoToAreas < ActiveRecord::Migration
  def self.up
    change_table :areas do |t|
      t.attachment :photo
    end
  end

  def self.down
    remove_attachment :areas, :photo
  end
end
