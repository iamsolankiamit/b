class Amenity < ActiveRecord::Base
  attr_accessible :air_conditioning, :baby_cot, :breakfast, :cable_tv, :doorman, :dryer, :elevator_in_building, :kids_friendly, :free_parking_on_premise, :gym, :handicap_accessible, :heating, :hot_tub, :indoor_fireplace, :intercom, :internet, :kitchen, :lockable_room, :pets_allowed, :pool, :sauna, :smoking_allowed, :suitable_for_events, :towels, :tv, :washer, :wireless_internet, :offer_id
  belongs_to :offer
end
