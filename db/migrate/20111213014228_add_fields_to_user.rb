class AddFieldsToUser < ActiveRecord::Migration
  def change
    add_column :users, :sex, :integer
    add_column :users, :uid, :string
    add_column :users, :provider, :string
    add_column :users, :username, :string
  end
end
