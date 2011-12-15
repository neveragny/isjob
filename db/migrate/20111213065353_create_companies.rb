class CreateCompanies < ActiveRecord::Migration
  def change
    create_table :companies do |t|
      t.string :name, {:empty => false}
      t.string :address
      t.integer :sphere_id, {:empty => false}
      t.string :info, {:empty => false}
      t.string :city, {:empty => false}
      t.string :url
      t.string :contact_person_name, {:empty => false}
      t.string :contact_person_phone, {:empty => false}
      t.string :contact_person_position, {:empty => false}
      t.string :contact_person_role, {:empty => false}
      t.timestamps
    end
  end
end
