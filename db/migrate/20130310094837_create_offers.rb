class CreateOffers < ActiveRecord::Migration
  def self.up
    create_table :offers do |t|
      t.integer :user_id
      t.boolean :visiblity
      t.string :email
      t.integer :contact_phone
      t.integer :contact_phone_backup
      t.string :object_type
      t.integer :size
      t.string :size_type
      t.integer :bathroom_count
      t.integer :max_guest_count
      t.integer :bed_count
      t.integer :bedroom_count
      t.string :bed_type
      t.boolean :allow_marketing
      t.string :street
      t.string :street_no
      t.string :address_addon
      t.string :city
      t.integer :zip
      t.string :country_code_iso
      t.string :currency
      t.float :nightly_rate_amount
      t.float :weekly_rate_amount
      t.float :monthly_rate_amount
      t.integer :extra_guest_charge_amount
      t.integer :included_guest_count
      t.integer :service_charge_amount
      t.string :cancelation_policy
      t.string :min_nights
      t.string :max_nights
      t.string :checkin_after
      t.string :checkout_before
      t.float :confidential_lng
      t.float :confidential_lat
      t.float :geo_precision
      t.boolean :is_verified , :default =>false
      t.timestamps
    end
  end

  def self.down
    drop_table :offers
  end
end
