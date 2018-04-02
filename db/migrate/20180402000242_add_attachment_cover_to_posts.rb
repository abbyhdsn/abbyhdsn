class AddAttachmentCoverToPosts < ActiveRecord::Migration[5.1]
  def self.up
    change_table :posts do |t|
      t.attachment :cover
    end
  end

  def self.down
    remove_attachment :posts, :cover
  end
end
