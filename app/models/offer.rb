class Offer < ActiveRecord::Base

   max_paginates_per 100

  before_save :set_email, :set_cancellation_policy, :set_contact, :split_city
  before_update :set_email
  after_update :verified_listing
  attr_accessible :visiblity, :email, :contact_phone, :contact_phone_backup, :object_type, :size, :size_type, :bathroom_count, :max_guest_count, :bed_count, :bedroom_count, :bed_type, :allow_marketing, :street, :street_no, :address_addon, :city, :zip, :country_code_iso, :currency, :nightly_rate_amount, :weekly_rate_amount, :monthly_rate_amount, :extra_guest_charge_amount, :included_guest_count, :service_charge_amount, :cancelation_policy, :min_nights, :max_nights, :checkin_after, :checkout_before, :confidential_lng, :confidential_lat, :geo_precision, :translations_attributes, :user_id, :is_verified, :photos_attributes, :calendars_attributes, :amenity_attributes

  has_many :translations, :dependent => :destroy
  accepts_nested_attributes_for :translations, :reject_if => lambda { |attrs| attrs.all? { |key, value| value.blank? } }

  has_many :photos, :dependent => :destroy
  accepts_nested_attributes_for :photos, :allow_destroy => true,:reject_if => lambda { |attrs| attrs.all? { |key, value| value.blank? } }
  belongs_to :user

  has_many :calendars, :dependent => :destroy
  accepts_nested_attributes_for :calendars, :allow_destroy => true,:reject_if => lambda { |attrs| attrs.all? { |key, value| value.blank? } }

  belongs_to :trips
  belongs_to :checkout
  has_many :inquiries, :dependent => :destroy

  has_one :amenity, :dependent => :destroy
  accepts_nested_attributes_for :amenity
#----------------------------------------------------------------------
  has_many :Pages
  scope :sort_by_price_asc,lambda{order("offers.nightly_rate_amount ASC")}
  scope :sort_by_price_dsc ,lambda{order("offers.nightly_rate_amount DESC")}        #since this is a model that is why this will query database
  scope :sort_by_recommended ,lambda{order("offers.search_rank DESC")}

  def self.sorting(sort)
    if sort == 'recommended'              
      sort_by_recommended
    else 
      sort_by_price_asc
     end
  end
#----------------------------------------------------------------------
  validates_presence_of :user_id, :nightly_rate_amount

  validates_numericality_of :max_nights,
    :max_guest_count,
    :zip,
    :size,
    :weekly_rate_amount,
    :monthly_rate_amount,
    :allow_nil => true

  validates_numericality_of :nightly_rate_amount
  geocoded_by :full_street_address , :latitude => :confidential_lat, :longitude => :confidential_lng

  after_validation :geocode

  def country
    Country.where(code: self.country_code_iso).first.name if self.country_code_iso.present?
  end

  def full_street_address
    [street_no, street, address_addon, city, country].compact.join(', ')
  end

  def split_city
    parts =  self.city.split(', ')
    self.city = parts[0]
  end

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
    if !search.nil? 
      if !search.empty?
        search_string = "%#{search}%"
        where(:is_verified => true).find(:all, :conditions => ['lower(city) LIKE ? ', search_string.downcase])
      end
    end
  end

  def verified_listing
    if self.translations.exists?
      if !self.translations.first.title.nil? and !self.translations.first.description.nil?
        translations_flag = true
      end
    end
    if self.photos.count >= 3
      photos_flag = true
    end
    if translations_flag == true and photos_flag == true
      self.is_verified = true
    end
  end
end
