class CreateCalendars < ActiveRecord::Migration
  def change
    create_table :calendars do |t|
      t.string :offer_id	:length => 6

      t.timestamps
    end
    random_id :calendars
  end

end
