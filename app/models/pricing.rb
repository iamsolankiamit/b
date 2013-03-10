class Pricing < ActiveRecord::Base
  attr_accessible :cancellation_policy, :checkin_after, :checkout_before, :cleaning, :extra_after, :extra_on_person, :max_stay, :min_stay, :month, :night, :week
  belongs_to :offer
end
