class CreateCalendars < ActiveRecord::Migration
  def change
    create_table :calendars do |t|
      t.string :offer_id
      t.date :date
      t.float :pricing
      t.boolean :availablity

      t.timestamps
    end
  end
end
