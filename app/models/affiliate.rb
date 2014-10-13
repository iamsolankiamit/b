class Affiliate < ActiveRecord::Base
  belongs_to :user
  attr_accessible :a_id, :name, :user_id
end
