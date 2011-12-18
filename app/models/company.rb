class Company < ActiveRecord::Base
  has_many :positions
  belongs_to :user

  attr_accessible :name, :city, :info, :contact_person_name, :contact_person_phone, :contact_person_position, :contact_person_role

  validates :name, :presence => true, :uniqueness => true, :length => { :maximum => 100 }
  validates :city, :presence => true, :uniqueness => true, :length => { :maximum => 100 }
  validates :info, :presence => true, :uniqueness => true, :length => { :maximum => 100 }
  validates :contact_person_name,
            :presence => true, :uniqueness => true, :length => { :maximum => 100 }
  validates :contact_person_phone,
            :presence => true, :uniqueness => true, :length => { :maximum => 100 }
  validates :contact_person_position,
            :presence => true, :uniqueness => true, :length => { :maximum => 100 }
  validates :contact_person_role,
            :presence => true, :uniqueness => true, :length => { :maximum => 100 }

end
