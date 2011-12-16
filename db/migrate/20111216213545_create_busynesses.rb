class CreateBusynesses < ActiveRecord::Migration
  def change
    create_table :busynesses do |t|
      t.string :role

      t.timestamps
    end
  end
end
