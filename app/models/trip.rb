class Trip < ActiveRecord::Base
  attr_accessible :card_holder_name, :total, :transaction_number
  has_one :checkout
end
