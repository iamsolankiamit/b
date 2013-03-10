class Photo < ActiveRecord::Base
  attr_accessible :aws_path, :description, :title
  belongs_to :offer
end
