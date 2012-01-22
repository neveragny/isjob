class CreateCvLanguages < ActiveRecord::Migration
  def change
    create_table :cv_languages do |t|
      t.string :name
      t.integer :level
      t.integer :cv_id
      t.timestamps
    end
  end
end
