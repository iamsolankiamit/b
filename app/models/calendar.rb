class Calendar < ActiveRecord::Base
  attr_accessible :availablity, :date, :offer_id, :pricing
  belongs_to :offer
  scope :between, lambda {|start_time, end_time, offer|
    {:conditions => ["date between ? and ? and offer_id = ?", Calendar.format_date(start_time), Calendar.format_date(end_time),offer] }
  }
  # need to override the json view to return what full_calendar is expecting.
  #   # http://arshaw.com/fullcalendar/docs/event_data/Event_Object/
  def as_json(options = {})
    {
      :id => self.id,
      :title => self.pricing.to_s,
      :addClass => "availablity-#{availablity.to_s}",
      :start => self.date.rfc822,
        :end => (self.date).rfc822,
        :allDay => true,
        :recurring => false
    }

  end

  def self.update_or_create_by_date(date,availablity,pricing,offer_id)
    calendar = self.find_by_date_and_offer_id(date,offer_id) || self.new(date: date, offer_id: offer_id, pricing: pricing, availablity: true)
    yield calendar
    calendar.save!
  end

  def self.format_date(date_time)
    converted_date_time = Time.at(date_time.to_i).to_formatted_s(:db)
    converted_date_time
  end
end
