class ReferalEmails < ActiveRecord::Migration
  def change

  	create_table :referal_emails do |t|
  		t.string :emails
  		t.integer :referer_id
  		t.timestamps

  end
end


end
