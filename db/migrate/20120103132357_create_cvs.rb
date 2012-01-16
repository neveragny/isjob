class CreateCvs < ActiveRecord::Migration
  def change
    create_table :cvs do |t|
      t.string   "title"
      t.string   "description"
      t.integer  "salary"
      t.boolean  "relocation"
      t.string   "job_type"
      t.string   "experience"
      t.boolean  "private"
      t.boolean  "active"
      t.integer  "user_id"

      t.timestamps
    end
  end
end
