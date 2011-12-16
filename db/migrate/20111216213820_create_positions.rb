class CreatePositions < ActiveRecord::Migration
  def change
    create_table :positions do |t|
      t.string :title
      t.string :description
      t.string :level
      t.integer :region_id
      t.integer :salary
      t.integer :busyness_id
      t.integer :education_id
      t.string :experience

      t.timestamps
    end
  end
end
