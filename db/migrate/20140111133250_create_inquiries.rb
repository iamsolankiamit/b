class CreateInquiries < ActiveRecord::Migration
  def change
    create_table :inquiries do |t|
      t.string :offer_id, nil: false
      t.integer :sender_id, nil: false
      t.integer :receiver_id, nil: false
      t.integer :message_id, nil: false
      t.date :check_in
      t.date :check_out
      t.integer :guest_count
      t.timestamps
    end
  end
end
