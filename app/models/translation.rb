class Translation < ActiveRecord::Base
  attr_accessible :description, :lang, :title
  belongs_to :offer
end
