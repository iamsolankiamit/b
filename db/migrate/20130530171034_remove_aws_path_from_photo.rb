class RemoveAwsPathFromPhoto < ActiveRecord::Migration
  def up
    remove_column :photos, :aws_path
  end

  def down
    add_column :photos, :aws_path, :string
  end
end
