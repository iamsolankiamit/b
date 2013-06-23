class ChangePhoneTypeToBigintInFloods < ActiveRecord::Migration
  def up
  	change_column :floods, :phone, :bigint
  end

  def down
  	change_column :floods, :phone, :decimal
  end
end
