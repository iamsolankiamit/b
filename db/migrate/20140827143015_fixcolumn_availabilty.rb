class FixcolumnAvailabilty < ActiveRecord::Migration
  def self.up
  	rename_column :calendars, :availablity, :availability
  end

  def self.down
  end
end
