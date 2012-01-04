class CreatePositionSphereJoinTable < ActiveRecord::Migration
  def change
    create_table :positions_spheres, :id => false do |t|
      t.integer :position_id
      t.integer :sphere_id
    end
  end
end
