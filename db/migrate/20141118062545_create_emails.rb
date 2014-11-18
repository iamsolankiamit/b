class CreateEmails < ActiveRecord::Migration
  def change
    create_table :emails do |t|
      t.attachment :file
      t.attachment :email_doc
      t.timestamps
    end
  end
end
