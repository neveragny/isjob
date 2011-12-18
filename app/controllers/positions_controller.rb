class PositionsController < ApplicationController
  before_filter :authenticate_user!, :except => :show

  def new
    @position = current_user.company.positions.build
    @spheres = Sphere.select(:title)
  end

  def create
  end

  def update
  end

  def delete
  end

  def activate
  end

  def deactivate
  end

end
