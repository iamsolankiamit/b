class CreateTranslations < ActiveRecord::Migration
  def change
    create_table :translations do |t|
      t.string :title
      t.text :description
      t.text :rules
      t.string :locale
      t.string :title_translated_by_google
      t.text :description_translated_by_google
      t.integer :offer_id

      t.timestamps
    end
  end
end
