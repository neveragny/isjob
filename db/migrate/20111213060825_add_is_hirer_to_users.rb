class AddIsHirerToUsers < ActiveRecord::Migration
  def change
    add_column :users, :is_hirer, :boolean, {:default => false}
  end
end
