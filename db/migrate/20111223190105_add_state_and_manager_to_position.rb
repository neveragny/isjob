class AddStateAndManagerToPosition < ActiveRecord::Migration
  def change
    add_column :positions, :active, :boolean
    add_column :positions, :user_id, :integer
  end
end
