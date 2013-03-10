class CreateTranslations < ActiveRecord::Migration
  def change
    create_table :translations do |t|
      t.string :title
      t.text :description
      t.string :lang

      t.timestamps
    end
  end
end
