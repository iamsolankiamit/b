class FixInquiriesColumnNames < ActiveRecord::Migration
  def up
    rename_column :inquiries, :sender_id, :guest_id
    rename_column :inquiries, :receiver_id, :host_id
  end

  def down
    rename_column :inquiries, :guest_id ,:sender_id
    rename_column :inquiries, :host_id ,:receiver_id

  end
end
