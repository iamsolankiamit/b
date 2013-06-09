class Offer < ActiveRecord::Base
  before_save :all_rate_setter
  attr_accessible :visiblity,
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
  								:confidential_lng,  # to be used when PostGIS is done
  								:confidential_lat,  # to be used when PostGIS is done
  								:geo_precision,
                  :translations_attributes,
                  :user_id,
                  :is_verified,
                  :photos_attributes


  has_many :translations, :dependent => :destroy
  accepts_nested_attributes_for :translations, :reject_if => lambda { |attrs| attrs.all? { |key, value| value.blank? } }

  has_many :photos, :dependent => :destroy
  accepts_nested_attributes_for :photos, :allow_destroy => true,:reject_if => lambda { |attrs| attrs.all? { |key, value| value.blank? } }
 
  belongs_to :users                       

  validates_presence_of :address_addon, :street, :street_no, :city, :country_code_iso, :user_id, :nightly_rate_amount

  validates_numericality_of :contact_phone_backup, :contact_phone, :max_nights, :max_guest_count, :zip, :size, :nightly_rate_amount, :weekly_rate_amount, :monthly_rate_amount       

  #Validations below, need to recheck If I missed some.



  def all_rate_setter
    if(self.monthly_rate_amount==nil)
      self.monthly_rate_amount=self.nightly_rate_amount
    end
    
    if(self.weekly_rate_amount==nil)
        self.weekly_rate_amount=self.nightly_rate_amount
    end
  end

  def self.search(search)
    # Currently only normal search is needed
    search_string = "%"+ search +"%"
    find(:all, :conditions => ['city LIKE ?', search_string] )
  end
end
