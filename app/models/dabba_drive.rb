class DabbaDrive < ActiveRecord::Base
  attr_accessible :address_line_1, :address_line_2, :dabba_type, :email, :name, :phone, :terms_accepted
end
