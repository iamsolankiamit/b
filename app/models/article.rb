class Article < ActiveRecord::Base
  attr_accessible :content, :title, :topic_id
  belongs_to :topic
end
