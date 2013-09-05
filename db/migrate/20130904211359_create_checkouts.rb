class CreateCheckouts < ActiveRecord::Migration
  def change
    create_table :checkouts do |t|
      t.string :offer_id, :null => false
      t.integer :guest_id, :null => false
      t.integer :host_id, :null => false
      t.date :check_in
      t.date :check_out
      t.integer :guest_count
      t.boolean :host_accepted, :null => false, :default => false
      t.float :total, :null => false
      t.string :email
      t.string :status
      t.datetime :booked_at
      t.string :phone
      t.decimal :service_tax, :null => false
      t.decimal :processing_fee, :default => 0.0
      t.string :cancellation_policy, :default => "strict"


      t.timestamps
    end
  end
end
