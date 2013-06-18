class RandomizeIdsOnOffers < ActiveRecord::Migration
  def up
    # make ids on a previously created table 
    # 'widgets' random (using string ids)
    random_str_id :offers, :id # you can specify id column name
  end

  def down
    remove_random_id :offers, :id
  end
end
