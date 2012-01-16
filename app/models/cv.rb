#  create_table "cvs", :force => true do |t|
#    t.string   "title"
#    t.integer  "user_id"
#    t.integer  "salary"
#    t.boolean  "expirience"
#    t.text     "info"
#    t.boolean  "status"
#    t.datetime "created_at"
#    t.datetime "updated_at"
#  end

class Cv < ActiveRecord::Base
  belongs_to :user
  has_many :experience, :dependent => :destroy, :class_name => 'Experience'

  accepts_nested_attributes_for :experience, :allow_destroy => true

#  attr_accessible :title, :salary, :experiences, :status, :info

  validates :title, :presence => true
#  validates :expirience, :presence => true //TODO impossible to submit form even if expirience is specified.
  validates :active, :presence => true
end
