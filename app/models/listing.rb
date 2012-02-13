  # create_table "listings", :force => true do |t|
  #   t.string   "current_occupation", :null => false
  #   t.integer  "current_salary",     :null => false
  #   t.string   "city",               :null => false
  #   t.string   "future_occupation",  :null => false
  #   t.integer  "future_salary",      :null => false
  #   t.string   "email"
  #   t.integer  "user_id"
  #   t.datetime "created_at"
  #   t.datetime "updated_at"
  # end

class Listing < ActiveRecord::Base
  validates :current_occupation, :presence => true, 
  															 :length => { :maximum => 100 }
  validates :current_salary, :presence => true, :length => { :maximum => 6 }
	validates :city, :presence => true, :length => { :maximum => 100 }
	validates :future_occupation, :presence => true, :length => { :maximum => 100 }
	validates :future_salary, :presence => true, :length => { :maximum => 6 }
	validates :email, :presence => true,
                    :uniqueness => true,
                    :format => {:with => /^([^@\s]+)@((?:[-a-z0-9]+\.)+[a-z]{2,})$/i}
  
end