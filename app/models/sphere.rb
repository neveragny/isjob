class Sphere < ActiveRecord::Base
  has_and_belongs_to_many :positions
end
