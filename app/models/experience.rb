#  create_table "experiences", :force => true do |t|
#    t.string   "company"
#    t.string   "city"
#    t.string   "position"
#    t.date     "date_start"
#    t.date     "date_end"
#    t.text     "description"
#    t.integer  "cv_id"
#    t.datetime "created_at"
#    t.datetime "updated_at"
#  end
class Experience < ActiveRecord::Base
  belongs_to :cv

  attr_accessible :company, :city, :positions, :date_start, :date_end, :description

end
