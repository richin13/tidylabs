class AddAttachmentImageToIdentificationCodes < ActiveRecord::Migration
  def self.up
    change_table :identification_codes do |t|
      t.attachment :image
    end
  end

  def self.down
    remove_attachment :identification_codes, :image
  end
end
