class InstallRandomId < ActiveRecord::Migration
  def up
    # install the necessary SQL functions in the DB
    create_random_id_functions
  end

  def down
    drop_random_id_functions
  end
end
