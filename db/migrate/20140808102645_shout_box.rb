class ShoutBox < ActiveRecord::Migration
	def change
		create_table :shouts do |t|
			t.string :destination
			t.string :city	
			t.string :country_code_iso 
			t.decimal  :per_night
			t.string   :email
			t.string   :contact_phone
			t.timestamps
		end
	end
end
