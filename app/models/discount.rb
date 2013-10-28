class Discount < ActiveRecord::Base
  attr_accessible :amount, :city, :from, :min_amount, :min_guests, :min_nights, :to, :code
end
