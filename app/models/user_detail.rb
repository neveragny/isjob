class UserDetail < ActiveRecord::Base
  belongs_to :user

  attr_accessible :sex, :first_name, :last_name, :birthday, :city, :phone

  def full_name
    "#{first_name} #{last_name}"
  end
end
