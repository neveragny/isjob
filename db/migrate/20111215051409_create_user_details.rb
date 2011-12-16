class CreateUserDetails < ActiveRecord::Migration
  def change
    create_table :user_details do |t|
      t.integer :sex, {:null => false, :default => 0}
      t.string :first_name, {:null => false}
      t.string :last_name, {:null => false}
      t.date :birthday, {:null => false}
      t.string :city, {:null => false}
      t.string :phone, {:null => false}
      t.timestamps

    end
  end
end
