class CreatePositionRegionJoinTable < ActiveRecord::Migration
  def change
    create_table :positions_regions, :id => false do |t|
      t.integer :position_id
      t.integer :region_id
    end
  end
end
