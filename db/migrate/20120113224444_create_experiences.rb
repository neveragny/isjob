class CreateExperiences < ActiveRecord::Migration
  def change
    create_table :experiences do |t|
      t.string  :company
      t.string  :city
      t.string  :position
      t.date    :date_start
      t.date    :date_end
      t.text    :description
      t.integer :cv_id

      t.timestamps
    end
  end
end
