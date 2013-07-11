class Calendar < ActiveRecord::Base
  attr_accessible :availablity, :date, :offer_id, :pricing
  belongs_to :offer
end
