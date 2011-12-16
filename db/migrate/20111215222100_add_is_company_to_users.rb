class AddIsCompanyToUsers < ActiveRecord::Migration
  def change
    add_column :users, :is_company, :boolean, { :null => false, :default => false}
  end
end
