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
  has_many :education, :dependent => :destroy, :class_name => 'Education'
  has_many :training, :dependent => :destroy, :class_name => 'Training'

  accepts_nested_attributes_for :experience, :allow_destroy => true
  accepts_nested_attributes_for :education, :allow_destroy => true
  accepts_nested_attributes_for :training, :allow_destroy => true
#  attr_accessible :title, :salary, :experiences, :status, :info

  acts_as_taggable_on :skills

  validates :title, :presence => true
#  validates :expirience, :presence => true //TODO impossible to submit form even if expirience is specified.
  validates :active, :presence => true
end
