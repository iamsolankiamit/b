class Offer < ActiveRecord::Base
  attr_accessible :u_id, 
  								:visiblity,
  								:email, 
  								:contact_phone, 
  								:contact_phone_backup, 
  								:object_type, 
  								:size, 
  								:size_type, 
  								:bathroom_count, 
  								:max_guest_count, 
  								:bed_count, 
  								:bedroom_count, 
  								:bed_type, 
  								:allow_marketing, 
  								:street, 
  								:street_no, 
  								:address_addon, 
  								:city, 
  								:zip, 
  								:country_code_iso, 
  								:currency, 
  								:nightly_rate_amount, 
  								:weekly_rate_amount, 
  								:monthly_rate_amount, 
  								:extra_guest_charge_amount, 
  								:included_guest_count, 
  								:service_charge_amount, 
  								:cancelation_policy, 
  								:min_nights, 
  								:max_nights, 
  								:checkin_after, 
  								:checkout_before,
  								:confidential_lng,
  								:confidential_lat,
  								:geo_precision,
                  :translations_attributes
  has_many :translations, :dependent => :destroy
  accepts_nested_attributes_for :translations,
                                :reject_if => lambda { |attrs| attrs.all? { |key, value| value.blank? } }
                                
                                

end
