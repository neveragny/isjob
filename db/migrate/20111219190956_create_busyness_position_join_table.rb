class CreateBusynessPositionJoinTable < ActiveRecord::Migration
  def change
    create_table :busynesses_positions, :id => false do |t|
      t.integer :busyness_id
      t.integer :position_id
    end
  end
end
