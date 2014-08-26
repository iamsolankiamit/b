class Shout < ActiveRecord::Base
	attr_accessible :destination,:city,:country_code_iso,:per_night,:email,:contact_phone

	validates_presence_of :destination,:per_night,:email,:contact_phone
	has_many :shout_discount
	
end