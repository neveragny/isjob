class Busyness < ActiveRecord::Base
  has_and_belongs_to_many :positions


  def to_s
    role
  end
end
