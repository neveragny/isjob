class CreateEducations < ActiveRecord::Migration
  def change
    create_table :educations do |t|
      t.integer :cv_id
      t.integer :level
      t.string  :name
      t.string  :faculty
      t.string  :city
      t.date    :date_start
      t.date    :date_end
      t.text    :description

      t.timestamps
    end
  end
end
