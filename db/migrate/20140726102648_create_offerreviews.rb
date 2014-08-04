class CreateOfferreviews < ActiveRecord::Migration
  def change
  	
  	create_table :offerreviews do |t|
  		t.integer :user_id
  		t.integer :trip_id	
  		t.string :offer_id  
  		t.string :content    
      	t.timestamps
    
    end

  end

  
end
