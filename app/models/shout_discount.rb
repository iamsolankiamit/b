class ShoutDiscount < ActiveRecord::Base

attr_accessible :offer_id,:offer_discount,:user_id, :shout_id
belongs_to :shout
end
