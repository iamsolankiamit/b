class CreateDabbaDrives < ActiveRecord::Migration
  def change
    create_table :dabba_drives do |t|
      t.string :name
      t.string :email
      t.string :phone
      t.string :address_line_1
      t.string :address_line_2
      t.string :dabba_type
      t.boolean :terms_accepted

      t.timestamps
    end
  end
end
