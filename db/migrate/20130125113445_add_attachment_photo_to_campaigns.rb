class AddAttachmentPhotoToCampaigns < ActiveRecord::Migration
  def self.up
    change_table :campaigns do |t|
      t.attachment :photo
    end
  end

  def self.down
    drop_attached_file :campaigns, :photo
  end
end
