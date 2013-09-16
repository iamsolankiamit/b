class Review < ActiveRecord::Base
  attr_accessible :review, :offer_id, :reviewee_id, :reviewer_id
  belongs_to :reviewer, :class_name => "User"
  belongs_to :reviewee, :class_name => "User"
  belongs_to :offer

  validates_presence_of :review, :offer_id, :reviewee_id, :reviewer_id
end
