class CreateListings < ActiveRecord::Migration
  def change
    create_table :listings do |t|
      t.string :current_occupation, :null => false
      t.integer :current_salary, :null => false
      t.string :city, :null => false
      t.string :future_occupation, :null => false
      t.integer :future_salary, :null => false
      t.string :email
      t.integer :user_id

      t.timestamps
    end
  end
end
