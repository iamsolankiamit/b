class Offer < ActiveRecord::Base
  before_save :set_email, :set_cancellation_policy, :set_contact
  before_update :set_email
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


  #Validations below, need to recheck If I missed some.

  validates_presence_of :address_addon, 
                        :street, 
                        :street_no, 
                        :city, 
                        :country_code_iso, 
                        :user_id, 
                        :nightly_rate_amount

  validates_numericality_of :contact_phone_backup, 
                            :contact_phone, 
                            :max_nights, 
                            :max_guest_count, 
                            :zip, 
                            :size, 
                            :weekly_rate_amount, 
                            :monthly_rate_amount,
                            :allow_nil => true


  validates_numericality_of :nightly_rate_amount

  def set_contact
    if self.contact_phone.nil?
      if !User.find(:all, :conditions => ['id=?', self.user_id]).first.phone.nil?
        self.contact_phone = User.find(:all, :conditions => ['id=?', self.user_id]).first.phone
      end
    end
  end


  def set_email
    if self.email.nil?
      self.email=User.find(:all, :conditions => ['id =?', self.user_id ]).first.email
    end
  end

  def set_cancellation_policy
    if self.cancelation_policy.nil?
      self.cancelation_policy="strict"
    end
  end

  def self.search(search)
    # Currently only normal search is needed
    if search.nil?
      search=""
    end
    search_string = "%"+ search +"%"
    where(:visiblity => true).find(:all, :conditions => ['lower(city) LIKE ?', search_string.downcase])
  end
end
