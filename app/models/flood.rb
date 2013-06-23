class Flood < ActiveRecord::Base
  attr_accessible :accommodates, :address, :city, :firstname, :lastname, :phone, :email

  validates_presence_of :address, :city, :firstname, :lastname, :phone, :email

  validates_numericality_of :phone
end
