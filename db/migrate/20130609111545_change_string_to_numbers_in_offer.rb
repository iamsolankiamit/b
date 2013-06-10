class ChangeStringToNumbersInOffer < ActiveRecord::Migration
  def up
  	change_column :offers, :contact_phone, :integer
  	change_column :offers, :contact_phone_backup, :integer
  	change_column :offers, :size, :integer
  	change_column :offers, :bathroom_count, :integer
  	change_column :offers, :max_guest_count, :integer
  	change_column :offers, :bed_count, :integer
  	change_column :offers, :bedroom_count, :integer
  	change_column :offers, :zip, :integer
  	change_column :offers, :nightly_rate_amount, :float
  	change_column :offers, :weekly_rate_amount, :float
  	change_column :offers, :monthly_rate_amount, :float
  	change_column :offers, :extra_guest_charge_amount, :integer
  	change_column :offers, :included_guest_count, :integer
  	change_column :offers, :service_charge_amount, :integer
  	change_column :offers, :max_nights, :integer
  	change_column :offers, :min_nights, :integer
  end

  def down
  	change_column :offers, :contact_phone, :string
  	change_column :offers, :contact_phone_backup, :string
  	change_column :offers, :size, :string
  	change_column :offers, :bathroom_count, :string
  	change_column :offers, :max_guest_count, :string
  	change_column :offers, :bed_count, :string
  	change_column :offers, :bedroom_count, :string
  	change_column :offers, :zip, :string
  	change_column :offers, :nightly_rate_amount, :float
  	change_column :offers, :weekly_rate_amount, :float
  	change_column :offers, :monthly_rate_amount, :float
  	change_column :offers, :extra_guest_charge_amount, :string
  	change_column :offers, :included_guest_count, :string
  	change_column :offers, :service_charge_amount, :string
  	change_column :offers, :max_nights, :string
  	change_column :offers, :min_nights, :string
  end
end
