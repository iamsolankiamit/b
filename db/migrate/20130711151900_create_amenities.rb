class CreateAmenities < ActiveRecord::Migration
  def change
    create_table :amenities do |t|
      t.string :offer_id, :limit => 6
      t.boolean :smoking_allowed
      t.boolean :pets_allowed
      t.boolean :tv
      t.boolean :cable_tv
      t.boolean :internet
      t.boolean :wireless_internet
      t.boolean :air_conditioning
      t.boolean :heating
      t.boolean :elevator_in_building
      t.boolean :handicap_accessible
      t.boolean :pool
      t.boolean :kitchen
      t.boolean :free_parking_on_premise
      t.boolean :doorman
      t.boolean :gym
      t.boolean :hot_tub
      t.boolean :indoor_fireplace
      t.boolean :intercom
      t.boolean :breakfast
      t.boolean :kids_friendly
      t.boolean :suitable_for_events
      t.boolean :washer
      t.boolean :dryer
      t.boolean :sauna
      t.boolean :towels
      t.boolean :lockable_room
      t.boolean :baby_cot

      t.timestamps
    end
  end
end
