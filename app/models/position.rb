class Position < ActiveRecord::Base
  belongs_to :company
  has_and_belongs_to_many :regions, :validate => true
  has_and_belongs_to_many :busynesses
  has_and_belongs_to_many :spheres

  accepts_nested_attributes_for :regions
  accepts_nested_attributes_for :busynesses
  accepts_nested_attributes_for :spheres

  validates :title, :presence => true
  validates :description, :presence => true
  validates :regions, :presence => true
  validates :spheres, :presence => true
  validates :busynesses, :presence => true

  def status
    active ? I18n.t(:"positions.status.active") : I18n.t(:"positions.status.nonactive") 
  end
end
