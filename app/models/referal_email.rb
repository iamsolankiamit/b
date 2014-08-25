class ReferalEmail < ActiveRecord::Base

attr_accessible :emails, :referer_id

belongs_to :referral
end