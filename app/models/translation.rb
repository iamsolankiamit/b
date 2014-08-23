class Translation < ActiveRecord::Base
  attr_accessible :description, 
  								:description_translated_by_google, 
  								:locale, 
  								:rules, 
  								:title, 
  								:title_translated_by_google,
  								:offer_id
  belongs_to :offers

 # validates_presence_of :title, :description


end
