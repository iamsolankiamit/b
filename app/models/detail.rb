class Detail < ActiveRecord::Base
  attr_accessible :accomodation, :alternate, :bathrooms, :bed_type, :bedroom, :beds, :email, :phone, :property_type, :size
  belongs_to :offer
end
