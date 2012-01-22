class CreateTrainings < ActiveRecord::Migration
  def change
    create_table :trainings do |t|
      t.string :institution
      t.string :course
      t.date :date_start
      t.date :date_end
      t.integer :cv_id

      t.timestamps
    end
  end
end
