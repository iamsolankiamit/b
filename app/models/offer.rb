class Offer < ActiveRecord::Base
  attr_accessible :available
  attr_accessible :detail_attributes
  attr_accessible :pricing_attributes
  attr_accessible :address_attributes
  attr_accessible :photos_attributes
  attr_accessible :translations_attributes
  has_one :detail
  has_one :pricing
  has_one :address
  has_many :photos
  has_many :translations
  accepts_nested_attributes_for :detail
  accepts_nested_attributes_for :pricing
  accepts_nested_attributes_for :address
  accepts_nested_attributes_for :photos,
  															:reject_if => lambda { |attrs| attrs.all? {|key,value| value.blank?}},
  															:allow_destroy => true
  accepts_nested_attributes_for :translations,
  															:reject_if => lambda { |attrs| attrs.all? {|key,value| value.blank?}},
  															:allow_destroy => true
end
