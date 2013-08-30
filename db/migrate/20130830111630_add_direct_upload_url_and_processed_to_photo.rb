class AddDirectUploadUrlAndProcessedToPhoto < ActiveRecord::Migration
  def up
    add_column :photos, :direct_upload_url, :string
    add_column :photos, :processed, :boolean
  end
  def down
    remove_column :photos, :direct_upload_url
    remove_column :photos, :processed
  end
end
