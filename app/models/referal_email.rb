class ReferalEmail < ActiveRecord::Base

attr_accessible :emails, :referer_id

belongs_to :referral


def self.add_manual_contacts (referer, email)
	referral = ReferalEmail.new(:referer_id => referer,:emails => email)
	referral.save!
	add_to_mailing_list(referral)
end
def self.add_gmail_contacts (referer, email)
	referral = ReferalEmail.new(:referer_id => referer, :emails => email)
	referral.save!
#	add_to_mailing_list(referral)
end

def self.add_to_mailing_list(referral)
	UserMailer.invites_mail(referral.emails,referral.referer_id).deliver
end
end