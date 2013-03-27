class CreateOffers < ActiveRecord::Migration
  def self.up
    create_table :offers do |t|
      t.string :u_id
      t.boolean :visiblity
      t.string :email
      t.string :contact_phone
      t.string :contact_phone_backup
      t.string :object_type
      t.string :size
      t.string :size_type
      t.string :bathroom_count
      t.string :max_guest_count
      t.string :bed_count
      t.string :bedroom_count
      t.string :bed_type
      t.boolean :allow_marketing
      t.string :street
      t.string :street_no
      t.string :address_addon
      t.string :city
      t.string :zip
      t.string :country_code_iso
      t.string :currency
      t.string :nightly_rate_amount
      t.string :weekly_rate_amount
      t.string :monthly_rate_amount
      t.string :extra_guest_charge_amount
      t.string :included_guest_count
      t.string :service_charge_amount
      t.string :cancelation_policy
      t.string :min_nights
      t.string :max_nights
      t.string :checkin_after
      t.string :checkout_before
      t.float :confidential_lng
      t.float :confidential_lat
      t.float :geo_precision
      t.timestamps
    end
  end

  def self.down
    drop_table :offers
  end
end
