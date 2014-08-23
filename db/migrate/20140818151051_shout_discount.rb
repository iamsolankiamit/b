class ShoutDiscount < ActiveRecord::Migration
	def change
		create_table :shout_discounts do |t|
			t.string   :offer_id
			t.integer  :offer_discount
			t.integer  :user_id	
			t.integer  :shout_id
			t.timestamps
		end

	end
end
