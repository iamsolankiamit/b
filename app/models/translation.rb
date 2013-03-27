class Translation < ActiveRecord::Base
  attr_accessible :description, :description_translated_by_google, :locale, :rules, :title, :title_translated_by_google
  belongs_to :offers
end
