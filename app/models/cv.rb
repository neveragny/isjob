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

  validates :title, :presence => true
  validates :expirience, :presence => true
  validates :status, :presence => true
end
