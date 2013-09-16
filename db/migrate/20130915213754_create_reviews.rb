class CreateReviews < ActiveRecord::Migration
  def change
    create_table :reviews do |t|
      t.integer :reviewer_id
      t.integer :reviewee_id
      t.string :offer_id, :length => 6
      t.string :review
      t.timestamps
    end
  end
end
