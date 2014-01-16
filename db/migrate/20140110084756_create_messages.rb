class CreateMessages < ActiveRecord::Migration
  def change
    create_table :messages do |t|
      t.boolean :delete_s, :default => false
      t.boolean :delete_r, :default => false
      t.text :content, nil: false
      t.integer :inquiry_id, nil: false
      t.timestamps
    end
  end
end
