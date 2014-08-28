class Fixcolumnname < ActiveRecord::Migration
  def self.up
    rename_column :users, :username, :slug
  end

  def self.down
  end

end
