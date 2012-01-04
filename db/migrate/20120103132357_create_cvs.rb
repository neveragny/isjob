class CreateCvs < ActiveRecord::Migration
  def change
    create_table :cvs do |t|
      t.string :title
      t.integer :user_id
      t.integer :salary
      t.boolean :expirience
      t.text :info
      t.boolean :status

      t.timestamps
    end
  end
end
