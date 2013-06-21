class CreateCalendarEvents < ActiveRecord::Migration
  def change
    create_table :calendar_events do |t|
      t.string :calendar_id, :length => 6
      t.date :on_date
      t.boolean :availability
      t.float :nightly_rate_amount
      t.timestamps
    end
  end
end
